#include <stdio.h>
#include <inttypes.h>

void addMat(int64_t* arr, int64_t* brr, int64_t size);

int main() {
    int64_t n;
    printf("Order of matrices: ");
    scanf("%ld", &n);
    int64_t arr[n*n], brr[n*n];
    printf("Elements of first Matrix: ");
    for (int64_t i = 0; i < n*n; i++) {
        scanf("%ld", &arr[i]);
    }
    printf("Elements of second Matrix: ");
    for (int64_t i = 0; i < n*n; i++) {
        scanf("%ld", &brr[i]);
    }
    addMat(arr, brr, n*n);
    printf("Sum of the matrices: \n");
    for (int64_t i = 0; i < n*n; i++) {
        printf("%ld ", arr[i]);
        if ((i+1)%n == 0) printf("\n");
    }
}
