#include <stdio.h>
#include<inttypes.h>

int64_t modeN(int64_t [],uint64_t);

int main(){
    long int a[]={5, 3, 4, 9, 16, 16, 16, 27, 27, 27, 27};
    printf("Max element of array is %ld\n",modeN(a,11));

    return 0;
}
