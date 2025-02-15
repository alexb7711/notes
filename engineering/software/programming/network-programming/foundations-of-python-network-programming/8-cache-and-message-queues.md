Caches and message queues have become fundamental building blocks for services under heavy load.

# Using Memcached
Memcached combines free, idle RAM on server on which it is installed into a single, large least-recently used (LRU)
cache. The actual procedure for using Memcached is designed to be simple.

- You run a Memcached daemon on every server with some spare memory.
- You make a list of the IP address and port numbers of your new Memcached daemons and distribute this list to all of
the clients that will be using the cache.
- Your client programs now have access to an organization-wide, blazingly fast key-value cache that acts something like
a big Python dictionary that all of your servers can share. The cache operates on an LRU basis, dropping old items that
have not been accessed for a while so that it has room to both accept new entries and keep records that are being
frequently accessed.

## Hashing And Sharding
When faced with several Memcached instances in a list, a Memcached client will shard the database by hashing each key’s
string value and letting the hash determine which server in the Memcached cluster is used to store that particular key.

# Message Queues
Message queue protocols let you send reliable chunks of data called messages instead of datagrams. The idea of datagram
is specific to unreliable services where data can be lost, duplicated, or reordered by the underlying network.
Typically, a message queue promises to transmit messages reliably and to deliver them automatically: a message either
arrives whole and intact, or it does not arrive at all.

There are many possible uses to which message queues are put.

- When you sign up for an account at a new web site using your email address, the site• typically responds immediately
with a page saying “Thank you, please watch your inbox for a confirmation e-mail,” without making you wait the several
minutes that it might take the site to reach your e-mail service provider to deliver it. The site typically accomplishes
this by putting your e-mail address into a message queue from which back-end servers can retrieve the address when they
are ready to attempt a new outgoing SMTP connection (Chapter 13). If a delivery attempt experiences a temporary failure,
then your e-mail address can simply be placed back on the queue with a longer timeout for a re-try attempt later.
- Message queues can be used as the basis for a custom• remote procedure call (RPC) (see Chapter 18) service, a pattern
in which busy front-end servers can offload difficult work by placing requests on a message queue that might have dozens
or hundreds of back-end servers listening to it and then waiting for a response.
- High-volume event data that needs to be aggregated or centrally stored and analyzed is often• streamed as tiny
efficient messages over a message queue. On some sites, this entirely replaces both on-machine logging to local hard
drives and older log transmission mechanisms such as syslog.

Each brand of message queue typically supports several topologies.

- A pipeline topology is the pattern that perhaps best resembles the picture you have in your head when you think of a
queue: a producer creates messages and submits them to the queue from which the messages can then be received by a
consumer. For example, the front-end web machines of a photo-sharing web site might accept image uploads from end users
and enroll the incoming files on an internal queue. A machine room full of thumbnail generators could then read from the
queue, with each agent receiving one message at a time containing the image for which it should generate several
thumbnails. The queue might get long during the day when the site is busy and then grow short or empty again during
periods of relatively low use, but either way the front-end web servers are freed to return a response quickly to the
waiting customer, telling the customer that their upload is successful and that their image will soon appear in their
photo stream.

- A publisher-subscriber or fanout topology looks like a pipeline but with a key difference. While the pipeline makes
sure that every queued message is delivered to exactly one consumer—since, after all, it would be wasteful for two
thumbnail servers to be assigned the same photograph—subscribers typically want to receive all of the messages that are
being queued the publishers. Alternatively, subscribers can specify a filter that narrows their interest to messages
with a particular format. This kind of queue can be used to power external services that need to push events to the
outside world. It can also form a fabric that a machine room full of servers can use to advertise which systems are up,
which are going down for maintenance, and which can even publish the addresses of other message queues as they are
created and destroyed.
- Finally, the• request-reply pattern is the most complex because messages have to make a round-trip. Both of the
previous patterns placed very little responsibility on the producer of a message: the producer connects to the queue and
transmits its message, and it is done. But a message queue client that makes a request has to stay connected and wait
for the reply to be delivered to it. The queue, to support this, has to feature some sort of addressing scheme by which
replies can be directed to the correct client, perhaps out of thousands of connected clients, which is still sitting and
waiting for it. But for all of its underlying complexity, this is probably the most powerful pattern of all. It allows
the load of dozens or hundreds of clients to be spread equally across large numbers of servers without any effort beyond
setting up the message queue. Since a good message queue will allow servers to attach and detach without losing
messages, this topology also allows servers to be brought down for maintenance in a way that is invisible to the
population of client machines.
