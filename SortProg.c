
#include "sort0.h"

#define greater(i,j)	((i) > (j))
#define exch(i,j)	{int k; k=(i); (i)=(j); (j)=(k);}


void sortprog(int *A, int l, int r) {
  int diff=0;
  int is_sorted = 0;
#ifdef DEBUG
  printf("[odd-even before] ");
  for(int i=l; i<=r; i++)printf("%d ", A[i]);
  printf("\n");
#endif
  
  while(is_sorted!=3){
    is_sorted |= (1<<diff);

#pragma omp parallel for
    for(int i=l+diff; i<r; i+=2){    
      if(greater(A[i], A[i+1])){
	exch(A[i], A[i+1]);
	is_sorted &= ~(1<<diff);
      }
    }
#ifdef DEBUG
    printf("[odd-even after] ");
    for(int i=l; i<=r; i++)printf("%d ", A[i]);
    printf("\n");
#endif
  }
}
