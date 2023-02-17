
_sort:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 68             	sub    $0x68,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  19:	89 45 90             	mov    %eax,-0x70(%ebp)
	float num[20];
	if (argc < 3)
  1c:	83 f8 02             	cmp    $0x2,%eax
  1f:	0f 8e 83 00 00 00    	jle    a8 <main+0xa8>
	{
		printf(1, "Please enter at least 2 numbers to sort them\n");
		exit();
	}
	for (int i =  0; i < argc - 1; i++)
  25:	83 e8 01             	sub    $0x1,%eax
  28:	31 ff                	xor    %edi,%edi
  2a:	8d 5d 98             	lea    -0x68(%ebp),%ebx
  2d:	89 45 94             	mov    %eax,-0x6c(%ebp)
		num[i] = atof(argv[i + 1]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 74 be 04          	push   0x4(%esi,%edi,4)
  37:	e8 a4 02 00 00       	call   2e0 <atof>
	for (int i =  0; i < argc - 1; i++)
  3c:	83 c4 10             	add    $0x10,%esp
		num[i] = atof(argv[i + 1]);
  3f:	d9 1c bb             	fstps  (%ebx,%edi,4)
	for (int i =  0; i < argc - 1; i++)
  42:	83 c7 01             	add    $0x1,%edi
  45:	3b 7d 94             	cmp    -0x6c(%ebp),%edi
  48:	75 e6                	jne    30 <main+0x30>
	float* temp = bubble_sort(num, argc - 1);
  4a:	83 ec 08             	sub    $0x8,%esp
  4d:	57                   	push   %edi
  4e:	53                   	push   %ebx
  4f:	e8 bc 03 00 00       	call   410 <bubble_sort>

	printf(1, "The sorted list of numbers: ");
  54:	59                   	pop    %ecx
  55:	5e                   	pop    %esi
  56:	68 06 0a 00 00       	push   $0xa06
  5b:	6a 01                	push   $0x1
	float* temp = bubble_sort(num, argc - 1);
  5d:	89 c3                	mov    %eax,%ebx
	printf(1, "The sorted list of numbers: ");
  5f:	e8 4c 06 00 00       	call   6b0 <printf>

	for (int i = 0; i < argc - 1; i++){
  64:	8b 45 90             	mov    -0x70(%ebp),%eax
  67:	83 c4 10             	add    $0x10,%esp
  6a:	8d 74 83 fc          	lea    -0x4(%ebx,%eax,4),%esi
  6e:	66 90                	xchg   %ax,%ax
		printfloat(1, temp[i]); 
  70:	83 ec 08             	sub    $0x8,%esp
  73:	ff 33                	push   (%ebx)
	for (int i = 0; i < argc - 1; i++){
  75:	83 c3 04             	add    $0x4,%ebx
		printfloat(1, temp[i]); 
  78:	6a 01                	push   $0x1
  7a:	e8 91 05 00 00       	call   610 <printfloat>
		printf(1, " ");
  7f:	58                   	pop    %eax
  80:	5a                   	pop    %edx
  81:	68 21 0a 00 00       	push   $0xa21
  86:	6a 01                	push   $0x1
  88:	e8 23 06 00 00       	call   6b0 <printf>
	for (int i = 0; i < argc - 1; i++){
  8d:	83 c4 10             	add    $0x10,%esp
  90:	39 f3                	cmp    %esi,%ebx
  92:	75 dc                	jne    70 <main+0x70>
	}
	printf(1, "\n");    
  94:	83 ec 08             	sub    $0x8,%esp
  97:	68 38 0a 00 00       	push   $0xa38
  9c:	6a 01                	push   $0x1
  9e:	e8 0d 06 00 00       	call   6b0 <printf>
  	exit();
  a3:	e8 f8 03 00 00       	call   4a0 <exit>
		printf(1, "Please enter at least 2 numbers to sort them\n");
  a8:	57                   	push   %edi
  a9:	57                   	push   %edi
  aa:	68 d8 09 00 00       	push   $0x9d8
  af:	6a 01                	push   $0x1
  b1:	e8 fa 05 00 00       	call   6b0 <printf>
		exit();
  b6:	e8 e5 03 00 00       	call   4a0 <exit>
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <strcpy>:
#include "x86.h"
#include <stdbool.h>

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave  
  e4:	c3                   	ret    
  e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
    p++, q++;
 116:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave  
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave  
 13c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret    
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave  
 198:	c3                   	ret    
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	57                   	push   %edi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 bb 02 00 00       	call   4b8 <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 1d                	je     230 <gets+0x50>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 19                	je     230 <gets+0x50>
  for(i=0; i+1 < max; ){
 217:	89 de                	mov    %ebx,%esi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 228:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22b:	5b                   	pop    %ebx
 22c:	5e                   	pop    %esi
 22d:	5f                   	pop    %edi
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret    
  buf[i] = '\0';
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	89 de                	mov    %ebx,%esi
 235:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 239:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23c:	5b                   	pop    %ebx
 23d:	5e                   	pop    %esi
 23e:	5f                   	pop    %edi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 255:	83 ec 08             	sub    $0x8,%esp
 258:	6a 00                	push   $0x0
 25a:	ff 75 08             	push   0x8(%ebp)
 25d:	e8 7e 02 00 00       	call   4e0 <open>
  if(fd < 0)
 262:	83 c4 10             	add    $0x10,%esp
 265:	85 c0                	test   %eax,%eax
 267:	78 27                	js     290 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	ff 75 0c             	push   0xc(%ebp)
 26f:	89 c3                	mov    %eax,%ebx
 271:	50                   	push   %eax
 272:	e8 81 02 00 00       	call   4f8 <fstat>
  close(fd);
 277:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	e8 47 02 00 00       	call   4c8 <close>
  return r;
 281:	83 c4 10             	add    $0x10,%esp
}
 284:	8d 65 f8             	lea    -0x8(%ebp),%esp
 287:	89 f0                	mov    %esi,%eax
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb ed                	jmp    284 <stat+0x34>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	0f be 02             	movsbl (%edx),%eax
 2aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2b5:	77 1e                	ja     2d5 <atoi+0x35>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ca:	0f be 02             	movsbl (%edx),%eax
 2cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d0:	80 fb 09             	cmp    $0x9,%bl
 2d3:	76 eb                	jbe    2c0 <atoi+0x20>
  return n;
}
 2d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d8:	89 c8                	mov    %ecx,%eax
 2da:	c9                   	leave  
 2db:	c3                   	ret    
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <atof>:


float atof(const char *s) {
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
 2e6:	83 ec 1c             	sub    $0x1c,%esp
 2e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  float digit = 0;
  int dp = 0;
  int neg = 0;
  first = 0;
  second = 0;
  if (s[0] == '-' )
 2ec:	0f be 01             	movsbl (%ecx),%eax
 2ef:	3c 2d                	cmp    $0x2d,%al
 2f1:	0f 84 a1 00 00 00    	je     398 <atof+0xb8>
  int neg = 0;
 2f7:	31 f6                	xor    %esi,%esi
  {
    neg = 1;
    s++;
  }

  while (*s != '\0')
 2f9:	84 c0                	test   %al,%al
 2fb:	0f 84 ae 00 00 00    	je     3af <atof+0xcf>
    neg = 1;
 301:	d9 ee                	fldz   
 303:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
 30a:	31 db                	xor    %ebx,%ebx
 30c:	d9 c0                	fld    %st(0)
 30e:	eb 20                	jmp    330 <atof+0x50>
  
    if (('0' <= *s && *s <= '9') || *s == '.')
    {
      if (*s != '.') 
      {
        if (dp) 
 310:	85 db                	test   %ebx,%ebx
 312:	75 54                	jne    368 <atof+0x88>
          second = second + digit;
          continue;
        } 
        else 
        {
          first = first * 10 + *s++ - '0';
 314:	d8 0d 3c 0a 00 00    	fmuls  0xa3c
 31a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
 31e:	df 45 e4             	filds  -0x1c(%ebp)
 321:	de c1                	faddp  %st,%st(1)
 323:	d8 25 40 0a 00 00    	fsubs  0xa40
  while (*s != '\0')
 329:	0f be 01             	movsbl (%ecx),%eax
 32c:	84 c0                	test   %al,%al
 32e:	74 21                	je     351 <atof+0x71>
    if (('0' <= *s && *s <= '9') || *s == '.')
 330:	8d 78 d0             	lea    -0x30(%eax),%edi
 333:	89 fa                	mov    %edi,%edx
 335:	80 fa 09             	cmp    $0x9,%dl
 338:	76 04                	jbe    33e <atof+0x5e>
 33a:	3c 2e                	cmp    $0x2e,%al
 33c:	75 7b                	jne    3b9 <atof+0xd9>
          digit = *s++ - '0';
 33e:	83 c1 01             	add    $0x1,%ecx
      if (*s != '.') 
 341:	3c 2e                	cmp    $0x2e,%al
 343:	75 cb                	jne    310 <atof+0x30>
  while (*s != '\0')
 345:	0f be 01             	movsbl (%ecx),%eax
          continue;
        }
      } 
      else 
      {
          dp = 1;
 348:	bb 01 00 00 00       	mov    $0x1,%ebx
  while (*s != '\0')
 34d:	84 c0                	test   %al,%al
 34f:	75 df                	jne    330 <atof+0x50>
    {
      printf(1, "Error: Invalid input \n");
      exit();
    } 
  }
  return neg ? (first + second) * -1: (first +second);
 351:	de c1                	faddp  %st,%st(1)
 353:	85 f6                	test   %esi,%esi
 355:	d9 c0                	fld    %st(0)
 357:	d9 e0                	fchs   
 359:	da c9                	fcmove %st(1),%st
 35b:	dd d9                	fstp   %st(1)
}
 35d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	8d 76 00             	lea    0x0(%esi),%esi
          digit = *s++ - '0';
 368:	83 e8 30             	sub    $0x30,%eax
 36b:	8b 55 e0             	mov    -0x20(%ebp),%edx
 36e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 371:	db 45 e4             	fildl  -0x1c(%ebp)
          for (int j = 1; j <= i; j++)
 374:	89 d8                	mov    %ebx,%eax
 376:	83 c2 01             	add    $0x1,%edx
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            digit = digit / 10;
 380:	d8 35 3c 0a 00 00    	fdivs  0xa3c
          for (int j = 1; j <= i; j++)
 386:	83 c0 01             	add    $0x1,%eax
 389:	39 d0                	cmp    %edx,%eax
 38b:	75 f3                	jne    380 <atof+0xa0>
          i++;
 38d:	89 45 e0             	mov    %eax,-0x20(%ebp)
          second = second + digit;
 390:	de c2                	faddp  %st,%st(2)
          continue;
 392:	eb 95                	jmp    329 <atof+0x49>
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while (*s != '\0')
 398:	0f be 41 01          	movsbl 0x1(%ecx),%eax
    s++;
 39c:	8d 51 01             	lea    0x1(%ecx),%edx
  while (*s != '\0')
 39f:	84 c0                	test   %al,%al
 3a1:	74 10                	je     3b3 <atof+0xd3>
    s++;
 3a3:	89 d1                	mov    %edx,%ecx
    neg = 1;
 3a5:	be 01 00 00 00       	mov    $0x1,%esi
 3aa:	e9 52 ff ff ff       	jmp    301 <atof+0x21>
  while (*s != '\0')
 3af:	d9 ee                	fldz   
 3b1:	eb aa                	jmp    35d <atof+0x7d>
 3b3:	d9 ee                	fldz   
 3b5:	d9 e0                	fchs   
 3b7:	eb a4                	jmp    35d <atof+0x7d>
 3b9:	dd d8                	fstp   %st(0)
 3bb:	dd d8                	fstp   %st(0)
      printf(1, "Error: Invalid input \n");
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	68 23 0a 00 00       	push   $0xa23
 3c5:	6a 01                	push   $0x1
 3c7:	e8 e4 02 00 00       	call   6b0 <printf>
      exit();
 3cc:	e8 cf 00 00 00       	call   4a0 <exit>
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <bubble_sort>:


float*
bubble_sort(float num[], int size)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	8b 75 0c             	mov    0xc(%ebp),%esi
 417:	8b 4d 08             	mov    0x8(%ebp),%ecx
 41a:	53                   	push   %ebx
  int i, j;
  float a;
  for (i = 0; i < size; i++)
 41b:	85 f6                	test   %esi,%esi
 41d:	7e 43                	jle    462 <bubble_sort+0x52>
 41f:	31 d2                	xor    %edx,%edx
  {
    for (j = i + 1; j < size; j++)
 421:	8d 1c b1             	lea    (%ecx,%esi,4),%ebx
 424:	83 c2 01             	add    $0x1,%edx
 427:	39 d6                	cmp    %edx,%esi
 429:	74 37                	je     462 <bubble_sort+0x52>
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
 430:	8d 04 91             	lea    (%ecx,%edx,4),%eax
 433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 437:	90                   	nop
    {
      if (num[i] > num[j]) 
 438:	d9 00                	flds   (%eax)
 43a:	d9 44 91 fc          	flds   -0x4(%ecx,%edx,4)
 43e:	db f1                	fcomi  %st(1),%st
 440:	76 0e                	jbe    450 <bubble_sort+0x40>
 442:	d9 c9                	fxch   %st(1)
      {
        a =  num[i];
        num[i] = num[j];
 444:	d9 5c 91 fc          	fstps  -0x4(%ecx,%edx,4)
        num[j] = a;
 448:	d9 18                	fstps  (%eax)
 44a:	eb 08                	jmp    454 <bubble_sort+0x44>
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	dd d8                	fstp   %st(0)
 452:	dd d8                	fstp   %st(0)
    for (j = i + 1; j < size; j++)
 454:	83 c0 04             	add    $0x4,%eax
 457:	39 d8                	cmp    %ebx,%eax
 459:	75 dd                	jne    438 <bubble_sort+0x28>
 45b:	83 c2 01             	add    $0x1,%edx
 45e:	39 d6                	cmp    %edx,%esi
 460:	75 ce                	jne    430 <bubble_sort+0x20>
      }
    }
  }

  return num;
}
 462:	5b                   	pop    %ebx
 463:	89 c8                	mov    %ecx,%eax
 465:	5e                   	pop    %esi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <sqrt>:


double 
sqrt(double x) {
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	dd 45 08             	fldl   0x8(%ebp)
  double guess = 1.0;
 476:	d9 e8                	fld1   
 478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop
  double prev_guess = 0.0;
  
  while (guess != prev_guess) {
    prev_guess = guess;
    guess = (guess + x / guess) / 2.0;
 480:	d9 c1                	fld    %st(1)
 482:	d8 f1                	fdiv   %st(1),%st
 484:	d8 c1                	fadd   %st(1),%st
 486:	d8 0d 44 0a 00 00    	fmuls  0xa44
  while (guess != prev_guess) {
 48c:	db e9                	fucomi %st(1),%st
 48e:	dd d9                	fstp   %st(1)
 490:	7a ee                	jp     480 <sqrt+0x10>
 492:	75 ec                	jne    480 <sqrt+0x10>
 494:	dd d9                	fstp   %st(1)
  }

  return guess;
}
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    

00000498 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 498:	b8 01 00 00 00       	mov    $0x1,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <exit>:
SYSCALL(exit)
 4a0:	b8 02 00 00 00       	mov    $0x2,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <wait>:
SYSCALL(wait)
 4a8:	b8 03 00 00 00       	mov    $0x3,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <pipe>:
SYSCALL(pipe)
 4b0:	b8 04 00 00 00       	mov    $0x4,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <read>:
SYSCALL(read)
 4b8:	b8 05 00 00 00       	mov    $0x5,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <write>:
SYSCALL(write)
 4c0:	b8 10 00 00 00       	mov    $0x10,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <close>:
SYSCALL(close)
 4c8:	b8 15 00 00 00       	mov    $0x15,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <kill>:
SYSCALL(kill)
 4d0:	b8 06 00 00 00       	mov    $0x6,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <exec>:
SYSCALL(exec)
 4d8:	b8 07 00 00 00       	mov    $0x7,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <open>:
SYSCALL(open)
 4e0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <mknod>:
SYSCALL(mknod)
 4e8:	b8 11 00 00 00       	mov    $0x11,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <unlink>:
SYSCALL(unlink)
 4f0:	b8 12 00 00 00       	mov    $0x12,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <fstat>:
SYSCALL(fstat)
 4f8:	b8 08 00 00 00       	mov    $0x8,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <link>:
SYSCALL(link)
 500:	b8 13 00 00 00       	mov    $0x13,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <mkdir>:
SYSCALL(mkdir)
 508:	b8 14 00 00 00       	mov    $0x14,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <chdir>:
SYSCALL(chdir)
 510:	b8 09 00 00 00       	mov    $0x9,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <dup>:
SYSCALL(dup)
 518:	b8 0a 00 00 00       	mov    $0xa,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <getpid>:
SYSCALL(getpid)
 520:	b8 0b 00 00 00       	mov    $0xb,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <sbrk>:
SYSCALL(sbrk)
 528:	b8 0c 00 00 00       	mov    $0xc,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <sleep>:
SYSCALL(sleep)
 530:	b8 0d 00 00 00       	mov    $0xd,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <uptime>:
SYSCALL(uptime)
 538:	b8 0e 00 00 00       	mov    $0xe,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 3c             	sub    $0x3c,%esp
 549:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 54c:	89 d1                	mov    %edx,%ecx
{
 54e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 551:	85 d2                	test   %edx,%edx
 553:	0f 89 7f 00 00 00    	jns    5d8 <printint+0x98>
 559:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55d:	74 79                	je     5d8 <printint+0x98>
    neg = 1;
 55f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 566:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 568:	31 db                	xor    %ebx,%ebx
 56a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 cf                	mov    %ecx,%edi
 576:	f7 75 c4             	divl   -0x3c(%ebp)
 579:	0f b6 92 a8 0a 00 00 	movzbl 0xaa8(%edx),%edx
 580:	89 45 c0             	mov    %eax,-0x40(%ebp)
 583:	89 d8                	mov    %ebx,%eax
 585:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 588:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 58b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 591:	76 dd                	jbe    570 <printint+0x30>
  if(neg)
 593:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 596:	85 c9                	test   %ecx,%ecx
 598:	74 0c                	je     5a6 <printint+0x66>
    buf[i++] = '-';
 59a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 59f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ad:	eb 07                	jmp    5b6 <printint+0x76>
 5af:	90                   	nop
    putc(fd, buf[i]);
 5b0:	0f b6 13             	movzbl (%ebx),%edx
 5b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	56                   	push   %esi
 5bf:	57                   	push   %edi
 5c0:	e8 fb fe ff ff       	call   4c0 <write>
  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x70>
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5df:	eb 87                	jmp    568 <printint+0x28>
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <putc>:
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 1c             	sub    $0x1c,%esp
 5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
{
 5fb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5fe:	8d 45 f4             	lea    -0xc(%ebp),%eax
 601:	50                   	push   %eax
 602:	ff 75 08             	push   0x8(%ebp)
 605:	e8 b6 fe ff ff       	call   4c0 <write>
}
 60a:	83 c4 10             	add    $0x10,%esp
 60d:	c9                   	leave  
 60e:	c3                   	ret    
 60f:	90                   	nop

00000610 <printfloat>:

void
printfloat(int fd, float xx)
{
 610:	55                   	push   %ebp
  int beg=(int)(xx);
	int fin=(int)(xx*100)-beg*100;
  printint(fd, beg, 10, 1);
 611:	b9 0a 00 00 00       	mov    $0xa,%ecx
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
  write(fd, &c, 1);
 61a:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 61d:	53                   	push   %ebx
 61e:	83 ec 38             	sub    $0x38,%esp
 621:	d9 45 0c             	flds   0xc(%ebp)
 624:	8b 75 08             	mov    0x8(%ebp),%esi
  int beg=(int)(xx);
 627:	d9 7d d6             	fnstcw -0x2a(%ebp)
  printint(fd, beg, 10, 1);
 62a:	6a 01                	push   $0x1
  int beg=(int)(xx);
 62c:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
 630:	80 cc 0c             	or     $0xc,%ah
 633:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
 637:	d9 6d d4             	fldcw  -0x2c(%ebp)
 63a:	db 55 d0             	fistl  -0x30(%ebp)
 63d:	d9 6d d6             	fldcw  -0x2a(%ebp)
 640:	8b 55 d0             	mov    -0x30(%ebp),%edx
	int fin=(int)(xx*100)-beg*100;
 643:	d8 0d bc 0a 00 00    	fmuls  0xabc
 649:	d9 6d d4             	fldcw  -0x2c(%ebp)
 64c:	db 5d d0             	fistpl -0x30(%ebp)
 64f:	d9 6d d6             	fldcw  -0x2a(%ebp)
 652:	6b c2 9c             	imul   $0xffffff9c,%edx,%eax
 655:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 658:	01 c3                	add    %eax,%ebx
  printint(fd, beg, 10, 1);
 65a:	89 f0                	mov    %esi,%eax
 65c:	e8 df fe ff ff       	call   540 <printint>
  write(fd, &c, 1);
 661:	83 c4 0c             	add    $0xc,%esp
 664:	c6 45 e7 2e          	movb   $0x2e,-0x19(%ebp)
 668:	6a 01                	push   $0x1
 66a:	57                   	push   %edi
 66b:	56                   	push   %esi
 66c:	e8 4f fe ff ff       	call   4c0 <write>
  putc(fd, '.');
	if(fin<10)
 671:	83 c4 10             	add    $0x10,%esp
 674:	83 fb 09             	cmp    $0x9,%ebx
 677:	7e 1f                	jle    698 <printfloat+0x88>
    putc(fd, '0');
	printint(fd, fin, 10, 1);
 679:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
	printint(fd, fin, 10, 1);
 683:	89 da                	mov    %ebx,%edx
 685:	89 f0                	mov    %esi,%eax
}
 687:	5b                   	pop    %ebx
	printint(fd, fin, 10, 1);
 688:	b9 0a 00 00 00       	mov    $0xa,%ecx
}
 68d:	5e                   	pop    %esi
 68e:	5f                   	pop    %edi
 68f:	5d                   	pop    %ebp
	printint(fd, fin, 10, 1);
 690:	e9 ab fe ff ff       	jmp    540 <printint>
 695:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 698:	83 ec 04             	sub    $0x4,%esp
 69b:	c6 45 e7 30          	movb   $0x30,-0x19(%ebp)
 69f:	6a 01                	push   $0x1
 6a1:	57                   	push   %edi
 6a2:	56                   	push   %esi
 6a3:	e8 18 fe ff ff       	call   4c0 <write>
    putc(fd, '0');
 6a8:	83 c4 10             	add    $0x10,%esp
 6ab:	eb cc                	jmp    679 <printfloat+0x69>
 6ad:	8d 76 00             	lea    0x0(%esi),%esi

000006b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 13             	movzbl (%ebx),%edx
 6c2:	84 d2                	test   %dl,%dl
 6c4:	74 6a                	je     730 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6c6:	8d 45 10             	lea    0x10(%ebp),%eax
 6c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d4:	eb 36                	jmp    70c <printf+0x5c>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
 6e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	74 15                	je     702 <printf+0x52>
  write(fd, &c, 1);
 6ed:	83 ec 04             	sub    $0x4,%esp
 6f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	56                   	push   %esi
 6f7:	e8 c4 fd ff ff       	call   4c0 <write>
 6fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 702:	0f b6 13             	movzbl (%ebx),%edx
 705:	83 c3 01             	add    $0x1,%ebx
 708:	84 d2                	test   %dl,%dl
 70a:	74 24                	je     730 <printf+0x80>
    c = fmt[i] & 0xff;
 70c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 70f:	85 c9                	test   %ecx,%ecx
 711:	74 cd                	je     6e0 <printf+0x30>
      }
    } else if(state == '%'){
 713:	83 f9 25             	cmp    $0x25,%ecx
 716:	75 ea                	jne    702 <printf+0x52>
      if(c == 'd'){
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	0f 84 07 01 00 00    	je     828 <printf+0x178>
 721:	83 e8 63             	sub    $0x63,%eax
 724:	83 f8 15             	cmp    $0x15,%eax
 727:	77 17                	ja     740 <printf+0x90>
 729:	ff 24 85 50 0a 00 00 	jmp    *0xa50(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 730:	8d 65 f4             	lea    -0xc(%ebp),%esp
 733:	5b                   	pop    %ebx
 734:	5e                   	pop    %esi
 735:	5f                   	pop    %edi
 736:	5d                   	pop    %ebp
 737:	c3                   	ret    
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 746:	6a 01                	push   $0x1
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 74e:	e8 6d fd ff ff       	call   4c0 <write>
        putc(fd, c);
 753:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 757:	83 c4 0c             	add    $0xc,%esp
 75a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 75d:	6a 01                	push   $0x1
 75f:	57                   	push   %edi
 760:	56                   	push   %esi
 761:	e8 5a fd ff ff       	call   4c0 <write>
        putc(fd, c);
 766:	83 c4 10             	add    $0x10,%esp
      state = 0;
 769:	31 c9                	xor    %ecx,%ecx
 76b:	eb 95                	jmp    702 <printf+0x52>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 10 00 00 00       	mov    $0x10,%ecx
 778:	6a 00                	push   $0x0
 77a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 77d:	8b 10                	mov    (%eax),%edx
 77f:	89 f0                	mov    %esi,%eax
 781:	e8 ba fd ff ff       	call   540 <printint>
        ap++;
 786:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 78a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78d:	31 c9                	xor    %ecx,%ecx
 78f:	e9 6e ff ff ff       	jmp    702 <printf+0x52>
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 798:	8b 45 d0             	mov    -0x30(%ebp),%eax
 79b:	8b 10                	mov    (%eax),%edx
        ap++;
 79d:	83 c0 04             	add    $0x4,%eax
 7a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7a3:	85 d2                	test   %edx,%edx
 7a5:	0f 84 8d 00 00 00    	je     838 <printf+0x188>
        while(*s != 0){
 7ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7b0:	84 c0                	test   %al,%al
 7b2:	0f 84 4a ff ff ff    	je     702 <printf+0x52>
 7b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7bb:	89 d3                	mov    %edx,%ebx
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7c3:	83 c3 01             	add    $0x1,%ebx
 7c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7c9:	6a 01                	push   $0x1
 7cb:	57                   	push   %edi
 7cc:	56                   	push   %esi
 7cd:	e8 ee fc ff ff       	call   4c0 <write>
        while(*s != 0){
 7d2:	0f b6 03             	movzbl (%ebx),%eax
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	84 c0                	test   %al,%al
 7da:	75 e4                	jne    7c0 <printf+0x110>
      state = 0;
 7dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7df:	31 c9                	xor    %ecx,%ecx
 7e1:	e9 1c ff ff ff       	jmp    702 <printf+0x52>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f8:	6a 01                	push   $0x1
 7fa:	e9 7b ff ff ff       	jmp    77a <printf+0xca>
 7ff:	90                   	nop
        putc(fd, *ap);
 800:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 806:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 808:	6a 01                	push   $0x1
 80a:	57                   	push   %edi
 80b:	56                   	push   %esi
        putc(fd, *ap);
 80c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 80f:	e8 ac fc ff ff       	call   4c0 <write>
        ap++;
 814:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 818:	83 c4 10             	add    $0x10,%esp
      state = 0;
 81b:	31 c9                	xor    %ecx,%ecx
 81d:	e9 e0 fe ff ff       	jmp    702 <printf+0x52>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 828:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 82b:	83 ec 04             	sub    $0x4,%esp
 82e:	e9 2a ff ff ff       	jmp    75d <printf+0xad>
 833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 837:	90                   	nop
          s = "(null)";
 838:	ba 48 0a 00 00       	mov    $0xa48,%edx
        while(*s != 0){
 83d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 840:	b8 28 00 00 00       	mov    $0x28,%eax
 845:	89 d3                	mov    %edx,%ebx
 847:	e9 74 ff ff ff       	jmp    7c0 <printf+0x110>
 84c:	66 90                	xchg   %ax,%ax
 84e:	66 90                	xchg   %ax,%ax

00000850 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 850:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	a1 2c 0e 00 00       	mov    0xe2c,%eax
{
 856:	89 e5                	mov    %esp,%ebp
 858:	57                   	push   %edi
 859:	56                   	push   %esi
 85a:	53                   	push   %ebx
 85b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 85e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 868:	89 c2                	mov    %eax,%edx
 86a:	8b 00                	mov    (%eax),%eax
 86c:	39 ca                	cmp    %ecx,%edx
 86e:	73 30                	jae    8a0 <free+0x50>
 870:	39 c1                	cmp    %eax,%ecx
 872:	72 04                	jb     878 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 874:	39 c2                	cmp    %eax,%edx
 876:	72 f0                	jb     868 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 878:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87e:	39 f8                	cmp    %edi,%eax
 880:	74 30                	je     8b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 882:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 885:	8b 42 04             	mov    0x4(%edx),%eax
 888:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 88b:	39 f1                	cmp    %esi,%ecx
 88d:	74 3a                	je     8c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 88f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 891:	5b                   	pop    %ebx
  freep = p;
 892:	89 15 2c 0e 00 00    	mov    %edx,0xe2c
}
 898:	5e                   	pop    %esi
 899:	5f                   	pop    %edi
 89a:	5d                   	pop    %ebp
 89b:	c3                   	ret    
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a0:	39 c2                	cmp    %eax,%edx
 8a2:	72 c4                	jb     868 <free+0x18>
 8a4:	39 c1                	cmp    %eax,%ecx
 8a6:	73 c0                	jae    868 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ae:	39 f8                	cmp    %edi,%eax
 8b0:	75 d0                	jne    882 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8b2:	03 70 04             	add    0x4(%eax),%esi
 8b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b8:	8b 02                	mov    (%edx),%eax
 8ba:	8b 00                	mov    (%eax),%eax
 8bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8bf:	8b 42 04             	mov    0x4(%edx),%eax
 8c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8c5:	39 f1                	cmp    %esi,%ecx
 8c7:	75 c6                	jne    88f <free+0x3f>
    p->s.size += bp->s.size;
 8c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8cc:	89 15 2c 0e 00 00    	mov    %edx,0xe2c
    p->s.size += bp->s.size;
 8d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8d8:	89 0a                	mov    %ecx,(%edx)
}
 8da:	5b                   	pop    %ebx
 8db:	5e                   	pop    %esi
 8dc:	5f                   	pop    %edi
 8dd:	5d                   	pop    %ebp
 8de:	c3                   	ret    
 8df:	90                   	nop

000008e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	57                   	push   %edi
 8e4:	56                   	push   %esi
 8e5:	53                   	push   %ebx
 8e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ec:	8b 3d 2c 0e 00 00    	mov    0xe2c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f2:	8d 70 07             	lea    0x7(%eax),%esi
 8f5:	c1 ee 03             	shr    $0x3,%esi
 8f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8fb:	85 ff                	test   %edi,%edi
 8fd:	0f 84 9d 00 00 00    	je     9a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 903:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 905:	8b 4a 04             	mov    0x4(%edx),%ecx
 908:	39 f1                	cmp    %esi,%ecx
 90a:	73 6a                	jae    976 <malloc+0x96>
 90c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 911:	39 de                	cmp    %ebx,%esi
 913:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 916:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 91d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 920:	eb 17                	jmp    939 <malloc+0x59>
 922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 928:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 92a:	8b 48 04             	mov    0x4(%eax),%ecx
 92d:	39 f1                	cmp    %esi,%ecx
 92f:	73 4f                	jae    980 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 931:	8b 3d 2c 0e 00 00    	mov    0xe2c,%edi
 937:	89 c2                	mov    %eax,%edx
 939:	39 d7                	cmp    %edx,%edi
 93b:	75 eb                	jne    928 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 93d:	83 ec 0c             	sub    $0xc,%esp
 940:	ff 75 e4             	push   -0x1c(%ebp)
 943:	e8 e0 fb ff ff       	call   528 <sbrk>
  if(p == (char*)-1)
 948:	83 c4 10             	add    $0x10,%esp
 94b:	83 f8 ff             	cmp    $0xffffffff,%eax
 94e:	74 1c                	je     96c <malloc+0x8c>
  hp->s.size = nu;
 950:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 953:	83 ec 0c             	sub    $0xc,%esp
 956:	83 c0 08             	add    $0x8,%eax
 959:	50                   	push   %eax
 95a:	e8 f1 fe ff ff       	call   850 <free>
  return freep;
 95f:	8b 15 2c 0e 00 00    	mov    0xe2c,%edx
      if((p = morecore(nunits)) == 0)
 965:	83 c4 10             	add    $0x10,%esp
 968:	85 d2                	test   %edx,%edx
 96a:	75 bc                	jne    928 <malloc+0x48>
        return 0;
  }
}
 96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 96f:	31 c0                	xor    %eax,%eax
}
 971:	5b                   	pop    %ebx
 972:	5e                   	pop    %esi
 973:	5f                   	pop    %edi
 974:	5d                   	pop    %ebp
 975:	c3                   	ret    
    if(p->s.size >= nunits){
 976:	89 d0                	mov    %edx,%eax
 978:	89 fa                	mov    %edi,%edx
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 980:	39 ce                	cmp    %ecx,%esi
 982:	74 4c                	je     9d0 <malloc+0xf0>
        p->s.size -= nunits;
 984:	29 f1                	sub    %esi,%ecx
 986:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 989:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 98c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 98f:	89 15 2c 0e 00 00    	mov    %edx,0xe2c
}
 995:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 998:	83 c0 08             	add    $0x8,%eax
}
 99b:	5b                   	pop    %ebx
 99c:	5e                   	pop    %esi
 99d:	5f                   	pop    %edi
 99e:	5d                   	pop    %ebp
 99f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9a0:	c7 05 2c 0e 00 00 30 	movl   $0xe30,0xe2c
 9a7:	0e 00 00 
    base.s.size = 0;
 9aa:	bf 30 0e 00 00       	mov    $0xe30,%edi
    base.s.ptr = freep = prevp = &base;
 9af:	c7 05 30 0e 00 00 30 	movl   $0xe30,0xe30
 9b6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9bb:	c7 05 34 0e 00 00 00 	movl   $0x0,0xe34
 9c2:	00 00 00 
    if(p->s.size >= nunits){
 9c5:	e9 42 ff ff ff       	jmp    90c <malloc+0x2c>
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 08                	mov    (%eax),%ecx
 9d2:	89 0a                	mov    %ecx,(%edx)
 9d4:	eb b9                	jmp    98f <malloc+0xaf>
