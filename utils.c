#include <stdio.h>
#include <stdlib.h>
#include "utils.h"

// GCC Don't provide a implementation for getline so here is a basic implementation
ssize_t my_getline(char **lineptr, size_t *n, FILE *stream) {
    size_t pos = 0;
    int c;

    if (*lineptr == NULL) {
        *n = 128;
        *lineptr = malloc(*n);
        if (*lineptr == NULL) return -1;
    }

    while (1) {
        if (pos >= *n - 1) {
            *n *= 2;
            char *new_lineptr = realloc(*lineptr, *n);
            if (new_lineptr == NULL) {
                return -1;
            }
        }

        c = fgetc(stream);

        // End of file
        if (c == EOF) {
            if (pos == 0) return -1;
            break;
        }

        (*lineptr)[pos++] = (char)c;

        // End of line
        if (c == '\n') { break; }
    }

    (*lineptr)[pos] = '\0';
    return pos;
}