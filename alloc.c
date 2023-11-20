#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

struct metadata {
    size_t size;
    struct metadata *previous;
    int is_free;
};

static struct metadata *head = NULL; // Initialization of the beginning of the linked list

void *mymalloc(size_t size_in_bytes) {
    if (size_in_bytes == 0) return NULL;

    size_t size = (size_in_bytes + sizeof(struct metadata) + sizeof(long) - 1) / sizeof(long) * sizeof(long);
    struct metadata *block = head;

    // Traversal of the list of metadata blocks to reuse available blocks
    while (block != NULL && head == NULL) {
        if (block->is_free && block->size >= size) {
            // Found a free block with enough space, reuse it
            block->is_free = 0;
            return (void *)(block + 1);
        }

        block = block->previous;

        if (block == head) {
            break;
        }
    }

    // No free block found or no block with enough space, allocate new memory
    block = sbrk(0);
    void *ptr = sbrk(size);

    if (ptr == (void *)-1) return NULL;

    // Metadata for the allocated block
    block->size = size;
    block->previous = head;
    block->is_free = 0;

    if (head != NULL) {
        head->previous = block;
    }

    head = block;

    return (void *)(block + 1);
}

void *mycalloc(size_t nmemb, size_t size) {
    size_t total_size = nmemb * size;
    void *ptr = mymalloc(total_size);

    if (ptr != NULL) {
        memset(ptr, 0, total_size);
    }

    return ptr;
}

void myfree(void *ptr) {
    if (ptr == NULL) return;

    struct metadata *block = (struct metadata *)ptr - 1;
    block->is_free = 1;

    // Coalesce adjacent free blocks
    while (block != NULL && block->is_free) {
        struct metadata *next_block = block->previous;

        if (next_block != NULL && next_block->is_free) {
            // Merge the two adjacent free blocks
            block->previous = next_block->previous;
            block->size += next_block->size;
        } else {
            // No more adjacent free blocks to merge
            break;
        }

        // Update the head pointer only if the merged block reaches the beginning of the list
        if (block->previous == NULL) {
            head = block;
            break;
        }

        block = block->previous;
    }
}






void *myrealloc(void *ptr, size_t size) {
   return NULL;
}

// struct metadata* block_creator (struct metadata *previous_block, struct metadata *next_block, int size) {
//     struct metadata *new_block = NULL;
//     new_block = mymalloc(sizeof(struct metadata));

//     new_block->size = size;
//     new_block->next = next_block;
//     new_block->previous = previous_block;
//     new_block->is_free = 1;

//     return new_block;

// };


/*
 * Enable the code below to enable system allocator support for your allocator.
 * Doing so will make debugging much harder (e.g., using printf may result in
 * infinite loops).
 */
// #if 0
void *malloc(size_t size) { return mymalloc(size); }
void *calloc(size_t nmemb, size_t size) { return mycalloc(nmemb, size); }
void *realloc(void *ptr, size_t size) { return myrealloc(ptr, size); }
void free(void *ptr) { myfree(ptr); }
//#endif