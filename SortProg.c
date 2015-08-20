
#include "sort0.h"

#define greater(i,j)	((i) > (j))
#define exch(i,j)	{int k; k=(i); (i)=(j); (j)=(k);}

void odd_even_sort(int *A, int l, int r, int n){
  int diff = n%2;
  #pragma omp parallel for
  for(int i=l+diff; i<r; i+=2){
    if(greater(A[i], A[i+1])) exch(A[i], A[i+1]);
  }
}


void sortprog(int *A, int l, int r) {
  int i, j;
  // check if the order is correct
  for(i=0; i<(r-l)-2; i++){    
    for (j = l; j < r; j++) {
      if (greater(A[j], A[j + 1])){
	odd_even_sort(A, l, r, i);
	break;
      }
    }
  }
}

