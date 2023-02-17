#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
	float num[20];
	if (argc < 3)
	{
		printf(1, "Please enter at least 2 numbers to sort them\n");
		exit();
	}
	for (int i =  0; i < argc - 1; i++)
		num[i] = atof(argv[i + 1]);
	float* temp = bubble_sort(num, argc - 1);

	printf(1, "The sorted list of numbers: ");

	for (int i = 0; i < argc - 1; i++){
		printfloat(1, temp[i]); 
		printf(1, " ");
	}
	printf(1, "\n");    
  	exit();
}
  
  
  
  
