#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

struct metadata {
    size_t data_size: 63;
    struct metadata *next;
    int is_free;
};

struct free_blocks {
    struct metadata *next;
    struct metadata *curent_block;
};

static struct metadata *head; // Initialization of the beginning of the linked list
static struct free_blocks *free_list;

void *mymalloc(size_t size_in_bytes) {

    if (size_in_bytes == 0) return NULL;

    size_t size = (size_in_bytes + sizeof(struct metadata) + sizeof(long) - 1) / sizeof(long) * sizeof(long);
    struct metadata *block = head;

    // Traversal of the list of metadata blocks to reuse available blocks
    while (block != NULL) {

        if (block->is_free && block->data_size >= size_in_bytes) {
            // Found a free block with enough space, reuse it
            block->is_free = 0;
            return block;
        }

        block = block->next;

    }

    // No free block found or no block with enough space, allocate new memory
    block = sbrk(0);
    void *ptr = sbrk(size);

    if (ptr == (void *)-1) return NULL;

    // Metadata for the allocated block
    block->next = NULL;
    block->is_free = 0;
    block->data_size = size_in_bytes;

    // First Iteration
    if (head == NULL) {
        head = block;
    }

    if (head != NULL) {

        struct metadata *current_block = head;
        while (current_block->next != NULL) {
            current_block = current_block->next;
        }
        current_block->next = block;

    }

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
    struct metadata *block = ptr - sizeof(struct metadata);
    block->is_free = 1;

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