#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <assert.h>
#include <math.h>
#include <inttypes.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>

/* 
 from /doc/Documentation/vm/pagemap.txt
    * Bits 0-54  page frame number (PFN) if present
    * Bits 0-4   swap type if swapped
    * Bits 5-54  swap offset if swapped
    * Bit  55    pte is soft-dirty (see Documentation/vm/soft-dirty.txt)
    * Bit  56    page exclusively mapped (since 4.2)
    * Bits 57-60 zero
    * Bit  61    page is file-page or shared-anon (since 3.5)
    * Bit  62    page swapped
    * Bit  63    page present
*/

unsigned long v2p(const unsigned long virt) {
  unsigned long page;
  int pagesize = sysconf(_SC_PAGESIZE);

  // permission check
  int euid = geteuid();
  if (euid != 0) {
    perror("ERROR: only CAP_SYS_ADMIN can read pagemap.\n");
    return 0;
  }

  // open pagemap
  int fd = open("/proc/self/pagemap", O_RDONLY);
  if (fd < 0) {
    perror("ERROR: failed to open pagemap.\n");
    return 0;
  }

  // seek to corresponding entry.
  unsigned long virt_pfn = virt / pagesize;
  unsigned long offset = 8 * virt_pfn;
  if (lseek(fd, (off_t)offset, SEEK_SET) == -1) {
    perror("ERROR: failed to lseek.\n");
    return 0;
  }

  // read entry. refer to above comment for the meaning.
  if (read(fd, &page, 8) != 8) {
    perror("ERROR: failed to read.\n");
    return 0;
  }
  close(fd);

  if ((page & 0x7fffffffffffffULL) == 0) {
    perror("ERROR: unknown\n");
    return 0;
  }

  return ((page & 0x7fffffffffffffULL) * pagesize) + (virt % pagesize);
}

int main() {
  unsigned long vmain = v2p((unsigned long)main);
  if (vmain == 0) {
    return 1;
  }
  printf("main: virt = 0x%016lx\n", (unsigned long)main);
  printf("      phys = 0x%016lx\n", vmain);
}
