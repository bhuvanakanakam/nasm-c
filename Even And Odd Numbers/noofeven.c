#include<stdio.h>
#include<inttypes.h>
int64_t noeven(int64_t[], int64_t);
int main()
{
    long int n;
    printf("Please Input N nalue: ");
    scanf("%ld\n",&n);
    long int A[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%ld",&A[i]);
    }
    printf("\n no of even elements in an array is %ld ",noeven(A,n));
    return 0;



}