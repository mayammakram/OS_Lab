#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include <stdbool.h>

char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}


float atof(const char *s) {
  float first, second;
  int i = 1;
  float digit = 0;
  int dp = 0;
  int neg = 0;
  first = 0;
  second = 0;
  if (s[0] == '-' )
  {
    neg = 1;
    s++;
  }

  while (*s != '\0')
  {
  
    if (('0' <= *s && *s <= '9') || *s == '.')
    {
      if (*s != '.') 
      {
        if (dp) 
        {
          digit = *s++ - '0';
          for (int j = 1; j <= i; j++)
            digit = digit / 10;
          i++;
          second = second + digit;
          continue;
        } 
        else 
        {
          first = first * 10 + *s++ - '0';
          continue;
        }
      } 
      else 
      {
          dp = 1;
          s++;
      }
    }   
    else 
    {
      printf(1, "Error: Invalid input \n");
      exit();
    } 
  }
  return neg ? (first + second) * -1: (first +second);
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}


float*
bubble_sort(float num[], int size)
{
  int i, j;
  float a;
  for (i = 0; i < size; i++)
  {
    for (j = i + 1; j < size; j++)
    {
      if (num[i] > num[j]) 
      {
        a =  num[i];
        num[i] = num[j];
        num[j] = a;
      }
    }
  }

  return num;
}


double 
sqrt(double x) {
  double guess = 1.0;
  double prev_guess = 0.0;
  
  while (guess != prev_guess) {
    prev_guess = guess;
    guess = (guess + x / guess) / 2.0;
  }

  return guess;
}
