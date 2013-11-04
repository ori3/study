#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    int i;
    int line_count = 0;

    for (i = 1; i < argc; i++) {
        FILE *f;
        int c;

        f = fopen(argv[i], "r");
        if (!f) {
            perror(argv[i]);
            exit(1);
        }
        while((c = fgetc(f)) != EOF) {
            if (c == 10) {
                line_count++;
            }
        }
        fclose(f);
    }
    printf("line count %d\n", line_count);
    exit(0);
}


