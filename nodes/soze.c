#include <stdio.h>
#include <string.h>
#include <inttypes.h>
int main(){
int msgsize= (int)(strlen("LATENCY:") +strlen("18446744073709551615 ")+1);
int64_t remote_ts, ts,seq;
int64_t a,b;
int64_t num=123;

a=1490273308094652;
b=10;
printf("%d\n",a-b);
printf("%" PRIu64 "\n", a-b);
printf("The size of message is %d",msgsize);
printf("%s\n", PRIu64);
uint64_t foo = 10;
printf("foo is equal to %\n" PRIu64, foo);
printf("rate of time %d\n", (int)(1000000.0 / 0.001));
sscanf("LATENCY:1490273308094652", "LATENCY:%"SCNd64,
                           &remote_ts);
sscanf("LATENCY:1490273308094652:T:123", "LATENCY:%"SCNc64,
                           &ts);
sscanf("LATENCY:1490273308094652:S:999", "%*[^S]S:%"SCNd64,
                           &seq);


printf("LATENCY:%" PRIu64 ":T:%" PRIu64 "\n", ts,b);
printf("SCNA %"PRIu64 "\n",remote_ts);
printf("PRII %"PRIu64 "\n",ts);

printf("seq %" PRIu64 "\n",seq);




}

