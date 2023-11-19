#include <stdio.h>
#include<inttypes.h>

int64_t Calc(int64_t,int64_t);

int main() {
    printf("Solution for calculating (a^3 - b^3) / (a + b) %ld\n",Calc(20,10));
    return 0;
}
