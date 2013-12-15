#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int
main(int argc, char *argv[])
{
    if (argc != 3) {
        fprintf(stderr, "%s: wrong arguments\n", argv[0]);
        exit(1);
    }


    int fd = open(argv[1], O_APPEND);
    if (rename(argv[1], argv[2]) < 0) {
        perror(argv[1]);
        exit(1);
    }
    char a[4] = "ABC";
    write(fd, a, sizeof a);
    printf("write: %s",a);
    close(fd);
    exit(0);
}
