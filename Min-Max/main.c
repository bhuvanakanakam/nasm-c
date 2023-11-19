#include <inttypes.h>

extern int64_t minimum(int64_t* arr, int64_t n);
extern int64_t maximum(int64_t* arr, int64_t n);

int main() {
    int64_t n;  
    scanf("%" SCNd64, &n); 
    int64_t arr[n];
    
    for (int64_t i = 0; i < n; i++) {
        scanf("%" SCNd64, &arr[i]);
    }
    
    int64_t minElem = minimum(arr, n);
    int64_t maxElem = maximum(arr, n);
    
    printf("Minimum element in array: %" PRId64 "\nMaximum element in array: %" PRId64 "\n", minElem, maxElem);

    return 0;
}
