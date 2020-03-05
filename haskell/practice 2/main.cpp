#include<stdio.h>

int main(){
	int n;
	printf("Enter n value: ");
	scanf("%i", &n);
	int prime[n+1];
	
	for(int i = 1; i <= n; i++){
		prime[i] = i;
    }
	for(int i = 2; i*i <= n; i++){
		if(prime[i] != -1){
			//Mark all the multiples of i as -1.
			for(int j = 2*i; j <=n ; j += i)
				prime[j] = -1;
		}
	}
	printf("Prime numbers are: \n");
	for(int i=2; i <= n; i++){
		if(prime[i] != -1){
			printf("%i ", i);
		}
	}
    return 0;
 }
 