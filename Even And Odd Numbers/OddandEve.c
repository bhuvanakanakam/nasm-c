#include<stdio.h>
#include<inttypes.h>

int64_t numEven(int64_t[], uint64_t);
int64_t numOdd(int64_t[], uint64_t);

int main() {
    int64_t a[] = {10, 20, 90, 2250, 60, 12340, 77, 99, 12, -4, 0, 56};
    uint64_t size = 12;

    printf("\nNumber of Even Elements in the Array: %ld\n", numEven(a, size));
    printf("Number of Odd Elements in the Array: %ld\n", numOdd(a, size));

    return 0;
}
