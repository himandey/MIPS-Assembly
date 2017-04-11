/* 18 January, 2012                   Himanshu Pandey

This program loads, sorts in order of increasing odd, and decreasing even, and prints 100 numbers. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
   int    Nums[100];
   int    NumNums, N;
   int    evens
   int    odds
   int     i
   int     j
   int     k
   int     x
   int     y

   if (argc != 2) {
     printf("usage: ./P1-1 valuefile\n");
     exit(1);
   }
   NumNums = Load_Mem(*++argv, Nums);
   if (NumNums != 100) {
      printf("valuefiles must contain 100 entries\n");
      exit(1);
   }

   /* Your program goes here */

   for(i = 0; i <sizeof(NumNums); i++){
   if(Nums[i]%2 != 0)
   {
       odds++;
   }
   else if(NumNums[i]%2 == 0)
   {
       evens++;
   }
   }

   for(k = 0; k <sizeof(Nums); k++){
   if(NumNums[k]%2 != 0){
     for(j = 0; j<=odds; j++){
     Nums[j] = NumNums[k];
     }
   }
   else if(NumNums[k]%2 == 0){
     for(j = odds+1; j<=100; j++){
     Nums[j] = NumNums[k];
     }
     }
   }

   
     for(j = 0; j<=odds; j++){
     if(Nums[j]>Nums[j+1]){
        x = Nums[j];
        Nums[j] = Nums[j+1];
        Nums[j+1] = x;
     }
   }
 
     for(j = odds+1; j<=100; j++){
     if(Nums[j+1]>Nums[j]){
        y = Nums[j+1];
        Nums[j+1] = Nums[j];
        Nums[j] = y;
     }
   }


   for(N = 0; N < NumNums; N++)           /* don't change this print loop */
      printf("%4d: %8d\n", N, Nums[N]);
}

/* This routine loads in up to 100 newline delimited integers from
a named file in the local directory. The values are placed in the
passed integer array. The number of input integers is returned. */

int Load_Mem(char *InputFileName, int IntArray[]) {
   int    N, Addr, Value, NumVals;
   FILE    *FP;

   FP = fopen(InputFileName, "r");
   if (FP == NULL) {
      printf("%s could not be opened; check the filename\n", InputFileName);
      return 0;
   } else {
      for (N=0; N < 100; N++) {
         NumVals = fscanf(FP, "%d: %d", &Addr, &Value);
         if (NumVals == 2)
            IntArray[N] = Value;
         else
            break;
      }
      fclose(FP);
      return N;
   }
}