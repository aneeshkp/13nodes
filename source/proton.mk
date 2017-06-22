# simple make file for the proton clients
# Must have the proton development packages installed
# (e.g. qpid-proton-c-devel)
#

all: proton-sender proton-receiver

proton-sender: proton-sender.c
	gcc  -Wall -g -Os $< -lqpid-proton -o $@

proton-receiver: proton-receiver.c
	gcc  -Wall -g -Os $< -lqpid-proton -o $@


.PHONY: clean
clean:
	rm -f *.o proton-receiver proton-sender

