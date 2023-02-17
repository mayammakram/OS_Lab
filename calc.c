#include "types.h"
#include "stat.h"
#include "user.h"


int
main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf(1, "Please enter at least a number.\n");
        exit();
    }

  int count = 0;
  float sum = 0;
  
  //Compute the average of numbers
    for (int i = 1; i < argc; i++) {
        float num = atof(argv[i]);
        count++;
        sum += num;
    }

    printf(1, "The average is ");
    float mean = sum / (argc-1);
    printfloat(1, mean);
    printf(1, ".\n");


  // find min and max
    float min = atof(argv[1]);
    float max = atof(argv[1]);
    for (int i = 1; i < argc; i++) {
        float num = atof(argv[i]);
        if (num < min) {
            min = num;
        }
        if (num > max) {
            max = num;
        }
    }
 
  printf(1, "The minimum number is ");
  printfloat(1, min);
  printf(1, ".\n");

  printf(1, "The maximum number is ");
  printfloat(1, max);
  printf(1, ".\n");


    //store numbers in array
    float numbers[argc - 1];
    for (int i = 1; i < argc; i++) {
        numbers[i - 1] = atof(argv[i]);
    }

    //sort numbers
    float *num = bubble_sort(numbers, argc - 1);

    printf(1, "The sorted list of numbers: ");
        int i;
        for (i = 0; i < argc - 1; i++){
            printfloat(1, num[i]); 
            printf(1, " ");
            }
        
        printf(1, "\n");

    //get median
    float median = 0;
    if ((argc - 1) % 2 == 0)
        median = (numbers[(argc-2) / 2] + numbers[((argc-2) / 2) + 1]) / 2;
    else
        median = numbers[(argc-2) / 2 ];
    
    
    printf(1, "The median is ");
    printfloat(1, median);
    printf(1, ".\n");

    //get square root
    // if(atof(argv[1]) < 0)
    // {
    //     printf(1, "The square root is imaginary.\n");
    // }
    // else if(atof(argv[1]) == 0)
    // {
    //     printf(1, "The square root is 0.00.\n");
    // }
    // else if(atof(argv[1]) > 0){
    // //get sqrt
    //   float q = sqrt(atof(argv[1]));
    //   printf(1, "The square root for the first parameter is ");
    //   printfloat(1, q);
    //   printf(1, ".\n");
    // }

  if (argc < 3)
    printf(1, "The standard deviation is 0.00.\n");
  // get standard deviation
  else 
  { 
    float sum2 = 0;
      for (int i = 0; i < argc - 1; i++) {
        sum2 += (numbers[i] - mean) * (numbers[i] - mean);
      }
      float std = sqrt(sum2 / (argc-1));

      printf(1, "The standard deviation is ");
      printfloat(1, std);
      printf(1, ". \n");
  }

exit();
}    



