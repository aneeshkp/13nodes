Proton Latency Testers
----------------------

proton-sender and proton-receiver are tools for measuring latency
across an AMQP 1.0 message bus.

proton-sender generates messages and includes a timestamp (in msecs
since EPOCH) in the message header.

proton-receiver listens for messages.  As messages arrive it computes
the latency by comparing the timestamp in the message to the current
time.  It will print latency statistics (either periodically or at
exit).

The tools require that the proton C development packages are
installed.  For fedora/centos/RHEL these packages are available at
EPEL (qpid-proton-c-devel).  Debian packages are available from the Qpid PPA:

    $ sudo add-apt-repository ppa:qpid/released
    $ sudo apt-get update

The tools can be built using the included proton.mk file:

    $ make -f proton.mk


Example
-------

This example shows a test run against the Qpid Dispatch router
(packages are available from the same repos as the proton C
development packages).

First, install and start the Qpid Dispatch Router (this assumes
RHEL/Fedora):

    $ sudo yum install qpid-dispatch-router qpid-dispatch-tools
    $ sudo systemctl start qdrouterd

Next spawn a proton-receiver instance:

    $ ./proton-receiver -t closest -l -c -1 -i 3 -a localhost:5672

In the case the receiver will connect to the qdrouterd listening on
the local 5672 port (-a) (this is the default for qdrouterd).  It will
check for latency (-l) and run 'forever' (-c -1).  It will print
statistics every 3 seconds once data arrives (-i 3).

The receiver is listening on the topic "closest" (-t closest). This
topic is one of the default topics created by qdrouterd.

Then run a few proton-senders to send messages to the "closest" topic:

    $ ./proton-sender -t closest -l -c -1 -m 1 -M 10 -a localhost:5672

The sender will add timestamps to the message (-l).  It will send
messages "forever" (-c -1).  It will pause a random number of
milliseconds between sending - in this case the pause will be > 1msec
and < 10msec (-m 1 -M 10).

The proton-receiver should start printing statistics periodically once
messages start arriving:

    ...
    Latency:   (15329 msgs received, 794 msgs/sec)
      Average: 0 msec
      Minimum: 1 msec
      Maximum: 2 msec
      Distribution:
        msecs: 0  messages: 11762
        msecs: 1  messages: 3566
        msecs: 2  messages: 1
    
    
    Latency:   (17734 msgs received, 801 msgs/sec)
      Average: 0 msec
      Minimum: 0 msec
      Maximum: 2 msec
      Distribution:
        msecs: 0  messages: 13619
        msecs: 1  messages: 4114
        msecs: 2  messages: 1
    ...

The above output shows that the average latency is less than 1 msec, with 4114
messages arriving after 1 msec, and one message that had 2 msec latency.

