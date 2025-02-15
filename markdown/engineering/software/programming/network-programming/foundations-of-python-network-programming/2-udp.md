If you think UDP is a great fit for your application, you might want to look into message queues (see Chapter 8).

# Port Numbers
The problem of distinguishing among many signals that are sharing the same channel is a general one, in both computer
networking and electromagnetic signal theory. A solution that allows several conversations to share a medium or
mechanism is known as a multiplexing scheme. For UDP, these conversations are distinguished by ports. The source port
identifies the particular process or program that sent the packet from the source machine, while the destination port
specifies the application that the destination IP addresses to which the communication should be delivered.

When making decisions about defining port numbers, such as 53 for DNS, IANA thinks of them as falling into three
ranges—and this applies to both UDP and TCP port numbers.

- Well-known ports (0–1023) are for the most important and widely used services. On many Unix-like operating systems,
normal user programs cannot listen on these ports. In the old days, this prevented troublesome undergraduates on
multiuser university machines from running programs that masqueraded as important system services. Today the same
caution applies when hosting companies hand out command-line Linux accounts.
- Registered ports (1024–49151) are not usually treated as special by operating systems—any user can write a program
that grabs port 5432 and pretends to be a PostgreSQL database, for example—but they can be registered by IANA for
specific services, and IANA recommends you avoid using them for anything but their assigned service.
- The remaining port numbers (49152–65535) are free for any use. They, as you will see, are the• pool on which modern
operating systems draw in order to generate arbitrary port numbers when a client does not care what port it is assigned
for its outgoing connection.

The database of well-known service names and port numbers is usually kept in the file `/etc/services` on Linux and Mac
OS X machines, which you can peruse at your leisure. The first few pages of the file, in particular, are littered with
ancient protocols that still have reserved numbers despite not having had an actual packet addressed to them anywhere in
the world for many years. An up-to-date (and typically much more extensive) copy is also maintained online by IANA at
[[www.iana.org/assignments/port-numbers]].

# Sockets
The underlying system calls for networking, on both Windows and POSIX systems (like Linux and Mac OS X), center around
the idea of a communications endpoint called a socket.

> **NOTE**: On pOSIX systems, the fileno() integer that identifies a socket is also a file descriptor drawn from the pool of
> integers representing open files. You might run across code that, assuming a pOSIX environment, fetches this integer and
> then uses it to perform non-networking calls like os.read() and os.write() on the file descriptor to do filelike things
> with what is actually a network communications endpoint. however, because the code in this book is designed to work on
> Windows as well, you will perform only true socket operations on your sockets.

```python
#!/usr/bin/env python3
# Foundations of Python Network Programming, Third Edition
# https://github.com/brandon-rhodes/fopnp/blob/m/py3/chapter02/udp_local.py
# UDP client and server on localhost

import argparse, socket
from datetime import datetime

MAX_BYTES = 65535

def server(port):
  sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  sock.bind(('127.0.0.1', port))
  print('Listening at {}'.format(sock.getsockname()))
  while True:
     data, address = sock.recvfrom(MAX_BYTES)
     text = data.decode('ascii')
     print('The client at {} says {!r}'.format(address, text))
     text = 'Your data was {} bytes long'.format(len(data))
     data = text.encode('ascii')
     sock.sendto(data, address)

def client(port):
  sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  text = 'The time is {}'.format(datetime.now())
  data = text.encode('ascii')
  sock.sendto(data, ('127.0.0.1', port))
  print('The OS assigned me the address {}'.format(sock.getsockname()))
  data, address = sock.recvfrom(MAX_BYTES) # Danger!
  text = data.decode('ascii')
  print('The server {} replied {!r}'.format(address, text))

if __name__ == '__main__':
  choices = {'client': client, 'server': server}
  parser = argparse.ArgumentParser(description='Send and receive UDP locally')
  parser.add_argument('role', choices=choices, help='which role to play')
  parser.add_argument('-p', metavar='PORT', type=int, default=1060, help='UDP port (default 1060)')
  args = parser.parse_args()
  function = choices[args.role]
  function(args.p)
```

## Promiscuous Clients and Unwelcome Replies
A listening network client that will accept or record every single packet that it sees, without regard for whether the
packet is correctly addressed, is known technically as a promiscuous client. Sometimes we write these deliberately, as
when we are doing network monitoring and want to see all of the packets arriving at an interface. In this case, however,
promiscuity is a problem.

Only good, well-written encryption should really convince your code that it has talked to the right server. Short of
that, there are two quick checks you can do. First, design or use protocols that include a unique identifier or request
ID in the request that gets repeated in the reply. If the reply contains the ID you are looking for, then—so long as the
range of IDs is large enough that someone could not simply be quickly flooding you with thousands or millions of packets
containing every possible ID—someone who saw your request must at least have composed it. Second, either check the
address of the reply packet against the address that you sent it to (remember that tuples in Python can simply be `==`
compared) or use connect() to forbid other addresses from sending you packets. See the following sections “Connecting
UDP Sockets” and “Request IDs” for more detail

## Unreliability, Backoff, Blocking, and Timeouts
Because of UDPs unreliability, the client has to perform its request in a loop. The client has to either prepared to
wait forever for a reply or have some way of method of determining that it has waited too long. This is difficult in the
UDP world because all the following scenarios are hard to distinguish:

- The reply is taking a long time to come back, but will soon arrive
- The reply will never arrive because it, or the request, was lost
- The server is down, and is not replying anymore

```python
#!/usr/bin/env python3
# Foundations of Python Network Programming, Third Edition
# https://github.com/brandon-rhodes/fopnp/blob/m/py3/chapter02/udp_remote.py
# UDP client and server for talking over the network

import argparse, random, socket, sys
MAX_BYTES = 65535

def server(interface, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((interface, port))
    print('Listening at', sock.getsockname())
    while True:
        data, address = sock.recvfrom(MAX_BYTES)
        if random.random() < 0.5:
            print('Pretending to drop packet from {}'.format(address))
            continue
        text = data.decode('ascii')
        print('The client at {} says {!r}'.format(address, text))
        message = 'Your data was {} bytes long'.format(len(data))
        sock.sendto(message.encode('ascii'), address)

def client(hostname, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    hostname = sys.argv[2]
    sock.connect((hostname, port))
    print('Client socket name is {}'.format(sock.getsockname()))
    delay = 0.1 # seconds
    text = 'This is another message'
    data = text.encode('ascii')
    while True:
        sock.send(data)
        print('Waiting up to {} seconds for a reply'.format(delay))
        sock.settimeout(delay)
        try:
            data = sock.recv(MAX_BYTES)
            except socket.timeout:
            delay *= 2 # wait even longer for the next request
            if delay > 2.0:
                raise RuntimeError('I think the server is down')
            else:
                break # we are done, and can stop looping

            print('The server says {!r}'.format(data.decode('ascii')))

if __name__ == '__main__':
	choices = {'client': client, 'server': server}
	parser = argparse.ArgumentParser(description='Send and receive UDP,' ' pretending packets are often dropped')
	parser.add_argument('role', choices=choices, help='which role to take')
	parser.add_argument('host', help='interface the server listens at;' 'host the client sends to')
	parser.add_argument('-p', metavar='PORT', type=int, default=1060, help='UDP port (default 1060)')
	args = parser.parse_args()
	function = choices[args.role]
	function(args.host, args.p)
```

## Connecting UDP Sockets
The listing from the previous section uses the `connect` command. This call does two things: it lets the operating
system know ahead of time the remote address which you want to send packets so that you can simply supply the data to
`send()` and not have to repeat the server address. The other thing that `connect()` does is ensures that the client is
not susceptible to receiving packets from other servers. The client listing will be included below for convenience.

```python
def client(hostname, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    hostname = sys.argv[2]
    sock.connect((hostname, port))
    print('Client socket name is {}'.format(sock.getsockname()))
    delay = 0.1 # seconds
    text = 'This is another message'
    data = text.encode('ascii')
    while True:
        sock.send(data)
        print('Waiting up to {} seconds for a reply'.format(delay))
        sock.settimeout(delay)
        try:
            data = sock.recv(MAX_BYTES)
            except socket.timeout:
            delay *= 2 # wait even longer for the next request
            if delay > 2.0:
                raise RuntimeError('I think the server is down')
            else:
                break # we are done, and can stop looping

            print('The server says {!r}'.format(data.decode('ascii')))
```

While this is convenient, it does come with a caveat. See the comparison below:

- You can use `sendto()` and direct each outgoing packet to a specific destination, then use `recvfrom()` to receive the
replies and carefully check each return address against the list of servers to which you have made outstanding requests.
- You can instead `connect()` your socket right after creating it and communicate with `send()` and `recv()`. The
operating system will filter out unwanted packets for you. This works only for speaking to one server at a time because
running `connect()` again on the same socket does not add a second destination address. Instead, it wipes out the first
address entirely so that no further replies from the earlier address will be delivered to your program.

Note that using `connect()` is not a form of security! If there is someone on the network who is malicious, it is
usually easy enough to forge packets with the server's return address. This is called spoofing.

## Request IDs: A Good Idea
If you ever design a scheme of your own for doing UDP requests and responses, you should strongly consider adding a
sequence number to each request and making sure that the reply you accept uses the same number.

Doing this two things. First, it protects you from being confused by duplicate answers to requests that were repeated
several times by a client performing exponential backoff. The second reason is to provide a deterrent against spoofing,
at leas in the case where the attackers cannot see your packets.

Again, these measures are not real security. Real security protects you even if attackers can both observe your traffic
and insert their own messages whenever they like.

# Binding To Interfaces
When creating a port binding for a server you have three options:

- '127.0.0.1' indicates that you want packets from other programs running only on the same machine,
- '' (empty string) is a wild card to indicate that you are willing to receive packets arriving to the server via any
  network interface, or
- you can provide an IP address of one the machine's external IP interfaces.

# UDP Fragmentation
While UDP does send small datagrams as single IP packets, it has to split larger UDP datagrams into several small IP
packets so that they can traverse the network (as was briefly discussed in Chapter 1). This means that large packets are
more likely to be dropped, since if any one of their pieces fails to make its way to the destination, then the whole
packet can never be reassembled and delivered to the listening operating system. Some operating systems gives you the
option to force UDP packets to not be fragmented and receive an error. You can use this error to set the maximum
transfer unit dynamically. This book seems to suggest that you can only do this in Linux.

```python
def send_big_datagram(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.IPPROTO_IP, IN.IP_MTU_DISCOVER, IN.IP_PMTUDISC_DO)
    sock.connect((host, port))
    try:
        sock.send(b'#' * 65000)
    except socket.error:
        print('Alas, the datagram did not make it')
        max_mtu = sock.getsockopt(socket.IPPROTO_IP, IN.IP_MTU)
        print('Actual MTU: {}'.format(max_mtu))
    else:
        print('The big datagram was sent!')
```

# Socket Options
Many options are specific to particular operating systems, and they may be finicky about how their options are
presented. Here are some of the more common options:
- `SO_BROADCAST`: This allows broadcast UDP packets to be sent and received.
- `SO_DONTROUTE`: Only be willing to send packets that are addressed to hosts on subnets to which
this computer is connected directly.
- `SO_TYPE`: When passed to `getsockopt()`, this returns to you whether a socket is of type `SOCK_DGRAM` and can be used
for UDP or whether it is of type SOCK_STREAM and instead supports the semantics of TCP (see Chapter 3).

# Broadcast
If UDP has a superpower, it is its ability to support broadcast. Instead of sending a datagram to some other specific
host, you can address it to an entire subnet to which your machine is attached and have the physical network card
broadcast the datagram so that all attached hosts see it without its having to be copied separately to each one of them.

With that being said, a more sophisticated technique called multicast has been developed that allows modern operating
systems to take better advantage of the intelligence built into many networks and network interface devices. Also,
multicast can work with hosts that are not on the local subnet.

When broadcasting, if you set up the server socking `bind()` to an empty string, then broadcasts from any client,
assuming the correct port is assigned, will be transmitted to the server! Another interesting thing to note is that you
can create multiple servers using an empty string. In other words, the server that accepts broadcasted messages do not
conflict on the network.

```python
#!/usr/bin/env python3
# Foundations of Python Network Programming, Third Edition
# https://github.com/brandon-rhodes/fopnp/blob/m/py3/chapter02/udp_broadcast.py
# UDP client and server for broadcast messages on a local LAN

import argparse, socket

BUFSIZE = 65535

def server(interface, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((interface, port))
    print('Listening for datagrams at {}'.format(sock.getsockname()))
    while True:
        data, address = sock.recvfrom(BUFSIZE)
        text = data.decode('ascii')
        print('The client at {} says: {!r}'.format(address, text))

def client(network, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    text = 'Broadcast datagram!'
    sock.sendto(text.encode('ascii'), (network, port))

if __name__ == '__main__':
    choices = {'client': client, 'server': server}
    parser = argparse.ArgumentParser(description='Send, receive UDP broadcast')
    parser.add_argument('role', choices=choices, help='which role to take')
    parser.add_argument('host', help='interface the server listens at;' ' network the client sends to')
    parser.add_argument('-p', metavar='port', type=int, default=1060, help='UDP port (default 1060)')
    args = parser.parse_args()
    function = choices[args.role]
    function(args.host, args.p)
```

## When To Use UDP
UDP is efficient only if your host sends only one message at a time and then waits for a response.

There are, however, a few good reasons to use UDP.

- Because you are implementing a protocol that already exists and it uses UDP.
- Because you are designing a time-critical media stream whose redundancy allows for• occasional packet loss and you
never want this second’s data getting hung up waiting for old data from several seconds ago that has not yet been
delivered (as happens with TCP).
- Because unreliable LAN subnet multicast is a great pattern for your application and UDP•
supports it perfectly.
