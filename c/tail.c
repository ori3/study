#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <getopt.h>

static void do_print(FILE *f);
static void do_tail(FILE *f, long nlines);

#define DEFAULT_N_LINES 10

static struct option longopts[] = {
    {"lines", required_argument, NULL, 'n'},
    {"help", no_argument,       NULL, 'h'},
    {0, 0, 0, 0}
};


int
main(int argc, char *argv[])
{
    int opt;
    long nlines = DEFAULT_N_LINES;

    while ((opt = getopt_long(argc, argv, "n:", longopts, NULL)) != -1) {
        switch (opt) {
        case 'n':
            nlines = atoi(optarg);
            break;
        case 'h':
            fprintf(stdout, "Usage: %s [-n LINES] [FILE ...]\n", argv[0]);
            exit(0);
        case '?':
            fprintf(stderr, "Usage: %s [-n LINES] [FILE ...]\n", argv[0]);
            exit(1);
        }
    }

    if (optind == argc) {
        do_tail(stdin, nlines);
    } else {
        int i;

        for (i = optind; i < argc; i++) {
            FILE *f;

            f = fopen(argv[i], "r");
            if (!f) {
                perror(argv[i]);
                exit(1);
            }
            do_tail(f, nlines);
            fclose(f);
        }
    }
    exit(0);
}

static void
do_print(FILE *f)
{
    int c;
    while ((c = getc(f)) != EOF) {
        if (putchar(c) < 0) exit(1);
    }
}

static void
do_tail(FILE *f, long nlines)
{
    int c;
    int current_pos;
    fpos_t pos;
    if (nlines <= 0) return;
    fseek(f, 0, SEEK_END);
    int file_count = ftell(f);
    //printf("all_! %ld byte\n", ftell(f));
    fseek(f, -2, SEEK_END);
    //printf("all_2 %ld byte\n", ftell(f));
    for (current_pos = file_count; current_pos >= 0; current_pos--) {
        fgetpos( f, &pos);
        c = getc(f);
      // printf("pos %d", pos);

      //if (putchar(c) < 0) exit(1);
        if (c == '\n') {
            nlines--;
            if (nlines == 0){
                do_print(f);
                return;
            }
        }
        fseek(f, -2, SEEK_CUR);
    }

    do_print(f);
}
