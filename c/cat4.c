#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <getopt.h>

static struct option longopts[] = {
    {"escape", required_argument, NULL, 'e'},
    {"help", no_argument,       NULL, 'h'},
    {0, 0, 0, 0}
};

int
main(int argc, char *argv[])
{

    int opt;
    int escape = 0;
    while ((opt = getopt_long(argc, argv, "e", longopts, NULL)) != -1) {
        switch (opt) {
        case 'e':
            escape = 1;
            break;
        case 'h':
            fprintf(stdout, "Usage: %s [-e]\n", argv[0]);
            exit(0);
        case '?':
            fprintf(stderr, "Usage: %s [-e]\n", argv[0]);
            exit(1);
        }
    }

    int i;

    for (i = optind; i < argc; i++) {
//    for (i = 1; i < argc; i++) {
        FILE *f;
        int c;

        f = fopen(argv[i], "r");
        if (!f) {
            perror(argv[i]);
            exit(1);
        }
        while((c = fgetc(f)) != EOF) {
            if (escape == 1 && c == 10) {
                if (putchar(36) < 0) exit(1);
                if (putchar(c) < 0) exit(1);
            } else if (escape == 1 && c == 9) {
                if (putchar(47) < 0) exit(1);
                if (putchar(116) < 0) exit(1);
            } else {
                if (putchar(c) < 0) exit(1);
            }
        }
        fclose(f);
    }
    exit(0);
}


