# The Building Blocks: Stacks And Libraries

# Application Layers

# Speaking The Protocol

# A Raw Network Conversation

# Turtles All The Way Down
An important lesson taken from the previous sections is that implementing network protocols correctly is difficult and
that you should use the Standard Library or third-party libraries whenever possible. This comes with the caveat that
just because you are using an external package for networking, that does mean you cannot understand how the package
works. Specifically, be attentive of how errors are thrown especially when the lower networking layers.

# Encoding And Decoding
- decoding is what happens when bytes are on their way into your application and you need to figure out what they mean.
- encoding is the process of taking character strings that you are ready to present to the world and turn them into
  bytes using one of the many encodings that digital computers use when they need to transmit or store symbols using
  bytes.

# The Internet Protocol
The fundamental unit of sharing among network devices, is the packet. A packet is a byte string whose length might range
from a few bytes to a few thousand bytes, which is transmitted as a single unit between network devices. A packet often
only has two properties at the physical level: the byte-string data and an address to which it needs to be delivered.

Expanding the concept to a large set of interconnected computers, the internet protocol is a scheme for imposing a
uniform system of addresses on all of the Internet-connected computers in the entire world and to make it possible for
packets travel from one end to the other.

# IP Addresses
Generally, traditional IP addresses can be read from left to right: the first one or two bytes specify an organization,
and then the next byte often specifies the particular subnet on which the target machine resides. the last byte narrows
down the address to that specific machine or service.

# Routing
Most, or perhaps all, of the Python code you write during your career will be running on hosts out at the edge of the
Internet, with a single network interface that connects them to the rest of the world. For such machines, routing
becomes a quite simple decision.

- If the IP address looks like• 127.*.*.*, then the operating system knows that the packet is destined for another
application running on the same machine. It will not even be submitted to a physical network device for transmission but
handed directly to another application via an internal data copy by the operating system.
- If the IP address is in the same subnet as the machine itself, then the destination host can be• found by simply
checking the local Ethernet segment, wireless channel, or whatever the local network happens to be, and sending the
packet to a locally connected machine.
- Otherwise, your machine forwards the packet to a• gateway machine that connects your local subnet to the rest of the
Internet. It will then be up to the gateway machine to decide where to send the packet after that.

# Packet Fragmentation
Packet fragmentation allows large pieces of data being sent over the network to be broken down into smaller packets. If
the "don't fragment" (DF) flag is set, then the protocol will attempt to send the data in one monolithic packet. If the
data is too large, 1'500-bytes for ethernet for example, and the DF flag is set, an error is returned. The largest
packet that an internet subnet can transmit is the maximum transmit unit (MTU).
