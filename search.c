#include "types.h"
#include "stat.h"
#include "user.h"

int main (int argc, char *argv[])
{
    if (argc < 3)
    {
        printf(1, "Please enter at least 2 numbers to search for the last one.\n");
        exit();
    }

    int x;
    int y= atof(argv[argc-1]);
 
    for (int i = 1; i < argc-1 ; i++)
    {
        x = atof(argv[i]);

        if(y == x)
        {
            printf(1,"It exists \n");
            exit();
        }
    }
    printf(1, "It does not exist \n");
    exit();
}