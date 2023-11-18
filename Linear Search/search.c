#include <stdio.h>
#include<inttypes.h>

int64_t searchN(int64_t [],uint64_t,uint64_t);

int main(){
    long int a[]={1,5,3,4,3,6,8,9};
    printf("Element is at %d\n",searchN(a,8,8));

    return 0;
}
