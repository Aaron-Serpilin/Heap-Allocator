#ifndef BLOCK_CREATOR_H
#define BLOCK_CREATOR_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <struct.h>
#include <alloc.h>

struct metadata* block_creator (struct metadata *previous_block, struct metadata *next_block, int size) {
    struct metadata *new_block = NULL;
    new_block = mymalloc(sizeof(struct metadata));

    new_block->size = size;
    new_block->next = next_block;
    new_block->previous = previous_block;
    new_block->is_free = 1;

    return new_block;

};

#endif