#include <inttypes.h>

int64_t minimum(int64_t* arr, int64_t n);
int64_t maximum(int64_t* arr, int64_t n);

int main() {
    int64_t n;  // no of elements in the array
    scanf("%ld",&n); 
    int64_t arr[n];
    for (int64_t i=0; i<n; i++) {
        scanf("%ld",&arr[i]);
    }
    int64_t minElem = minimum(arr, n);
    int64_t maxElem = maximum(arr, n);
    printf("Minimum element in array: %ld \nMaximum element in array: %ld\n", minElem, maxElem);
}
