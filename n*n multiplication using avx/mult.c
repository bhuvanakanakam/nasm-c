#include <stdio.h>
#include <inttypes.h>

void mulMat(int64_t [],int64_t [],int64_t [],int64_t);

int main(){
    long int n;
    printf("\n Enter the value of n: ");
    scanf("%ld",&n);
    long int A[n*n],B[n*n],C[n*n];

    for(long int i=0;i<n;i++){
        for(long int j=0;j<n;j++){
            A[i*n+j]=i;
            B[i*n+j]=i+j;
            C[i*n+j]=0;
        }
    }

    mulMat(A,B,C,n);

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",A[i*n+j]);
        }
        printf("\n");

    }
    
    printf("\n \n");

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",B[i*n+j]);
        }
        printf("\n");

    }


    printf("\n \n");

    for(long int i=0;i<n;i++)
    {
        for(long int j=0;j<n;j++)
        {
            printf("\t %ld",C[i*n+j]);
        }
        printf("\n");

    }
    
}
