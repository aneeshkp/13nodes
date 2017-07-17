# simple make file for the proton clients
# Must have the proton development packages installed
# (e.g. qpid-proton-c-devel)
#

all: proton-sender proton-receiver

proton-sender: proton-sender.c proton-common.c
	gcc -std=gnu99 -Wall -g -Os -lqpid-proton -lm -o $@ $^

proton-receiver: proton-receiver.c proton-common.c
	gcc -std=gnu99 -Wall -g -Os -lqpid-proton -lm -o $@ $^


.PHONY: clean
clean:
	rm -f *.o proton-receiver proton-sender

