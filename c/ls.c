#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <stdlib.h>
#include <sys/types.h>
#include <dirent.h>





static void do_ls(char *path, char *prefix);

int
main(int argc, char *argv[])
{
    int i;

    if (argc < 2) {
        fprintf(stderr, "%s: no arguments\n", argv[0]);
        exit(1);
    }
    for (i  = 1; i < argc; i++) {
        do_ls(argv[i], NULL);
    }
    exit(0);
}

static void
do_ls(char *path, char *prefix)
{
    DIR *d;
    struct dirent *ent;
    char current_dir[255] = "";
    char next_dir[255] = "";
    strcat(next_dir, path);

    strcat(current_dir, path);

    d = opendir(current_dir);
    if (!d) {
        perror(path);
        exit(1);
    }
    while (ent = readdir(d)) {
        if (ent->d_type == DT_DIR) {
            if (strcmp(ent->d_name, ".") == 0 ||
                (strcmp(ent->d_name, "..") == 0)) {
            } else {

                //strcat(next_dir, "/");
                //strcat(next_dir, ent->d_name);
                //strcat(next_dir, "/");

                //printf("current_dir: %s\n", current_dir);
                sprintf(next_dir,"%s/%s", current_dir,ent->d_name);
                //printf("next_dir: %s\n", next_dir);
                //printf("-*-* traversal this is dir name: %s\n", next_dir);

                do_ls(next_dir, NULL);
            }
        } else {
            //printf("%s\n", ent->d_name);
            printf("%s/%s\n", current_dir, ent->d_name);
        }
    }
    closedir(d);
}


