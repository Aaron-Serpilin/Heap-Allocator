#ifndef STRUCTS_H
#define STRUCTS_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

struct metadata {
    size_t size;
    struct metadata *next;
    struct metadata *previous;
    int is_free;
};

#endif