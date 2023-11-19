#include<stdio.h>
#include<inttypes.h>
int64_t sq_diff(int64_t,int64_t);
int main(){
	long int a =13,b=12;
	printf("Result for calculating a^2-b^2 is %ld\n",sq_diff(a,b));
	return 0;
}
