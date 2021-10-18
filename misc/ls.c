#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <errno.h>

struct linux_dirent {
  unsigned long  d_ino;
  off_t          d_off;
  unsigned short d_reclen;
  char           d_name[];
};

int ls(char *root) {
  int fd;
  if ((fd = open(root, O_RDONLY | O_DIRECTORY)) < 0) {
    printf("failed to open %s.\n", root);
    return -1;
  }

  while (1==1) {
    char dbuf[0x100] = {0}, pbuf[0x100] = {0};
    int n;
    struct linux_dirent *dent = (struct linux_dirent*)dbuf;

    if((n = syscall(SYS_getdents64, fd, dent, sizeof(dbuf))) < 0) {
      printf("failed getdent64()\n");
      return -1;
    } else if (n == 0) 
      break;

    while ((char*)dent < dbuf + n) {
      snprintf(pbuf, sizeof(pbuf), "%s", dent->d_name);
      printf("%s : ", pbuf);
      for (int ix = 0; (char)pbuf[ix] != (char)0; ++ix)
      {
        printf("%02x", pbuf[ix]);
      }
      printf("\n");
      dent = (void *)((char *)dent + dent->d_reclen);
    }
  }

  return 0;
}

int main(void) {
  ls("/");
  return 0;
}
