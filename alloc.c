#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <block_creator.h> // To create the new metadata blocks
#include <structs.h> // For the metadata struct

struct metadata {
    size_t size;
    struct metadata *next;
    struct metadata *previous;
    int is_free;
};

void *mymalloc(size_t size_in_bytes) {
    
    if (size_in_bytes == 0) return NULL;

    size_t size = (size_in_bytes + sizeof(struct metadata) + sizeof(long) - 1) / sizeof(long) * sizeof(long); // Total size of the memory block, including the metadata and user's data

    struct metadata *block = sbrk(0);  // Get the current end of the heap (where the new allocation will occur) without modifying the break value
    void *ptr = sbrk(size); // We increase the program's data space, meaning we allocate memory

    if (ptr == (void *)-1) return NULL; 

    // Metadata for the allocated block
    block->size = size;
    block->next = NULL;
    block->previous = NULL;
    block->is_free = 0;

    return (void *)(block + 1); // Pointer to the user-accessible memory, skipping metadata
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
    if (ptr == NULL) return;  // Do nothing if given a NULL pointer

    // Move the pointer back to the metadata block
    struct metadata *block = (struct metadata *)ptr - 1;

    // Mark the block as free
    block->is_free = 1;

    // Merge consecutive free blocks before the current block
    struct metadata *previous = block->previous;
    while (previous != NULL && previous->is_free) {
        previous->size += block->size;
        previous->next = block->next;
        if (block->next != NULL) {
            block->next->previous = previous;
        }
        block = previous;  // Update block to the merged block
        previous = block->previous;
    }

    // Merge consecutive free blocks after the current block
    struct metadata *current = block;
    struct metadata *next = block->next;
    while (next != NULL && next->is_free) {
        current->size += next->size;
        current->next = next->next;
        if (next->next != NULL) {
            next->next->previous = current;
        }
        next = current->next;
    }

    // Optional: Release memory if at the end of the heap
    void *end_of_heap = sbrk(0);
    void *end_of_block = (void *)((char *)current + current->size);

    if (end_of_block == end_of_heap) {
        // Release memory if at the end of the heap
        brk(current);
    }
}



void *myrealloc(void *ptr, size_t size) {
    return NULL;
}


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
