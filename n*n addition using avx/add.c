#include <stdio.h>
#include <inttypes.h>
#include <time.h>

void addMat(int64_t [],int64_t [],int64_t [],int64_t);

int main(){
    long int n;
    printf("\n Enter the value of n: ");
    scanf("%ld",&n);
    long int A[n*n],B[n*n],C[n*n];

    for(long int i=0;i<n;i++){
        for(long int j=0;j<n;j++){
            A[i*n+j]=i;
            B[i*n+j]=i+j;
        }
    }
    clock_t start_time = clock();
    addMat(A,B,C,n*n);
    clock_t end_time = clock();

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",A[i*n+j]);
        }
    }
    
    printf("\n \n");

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",B[i*n+j]);
        }
    }

    printf("\n \n");

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",C[i*n+j]);
        }
    }
    
    double elapsed_time = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;

    printf("Elapsed time: %f seconds\n", elapsed_time);

}
