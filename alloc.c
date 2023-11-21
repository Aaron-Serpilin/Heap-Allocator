#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define nextBlock(currentBlock) ((struct metadata *)((char *)(currentBlock + 1) + currentBlock->data_size))
#define alignSize(size) ((size + sizeof(long) - 1) & ~(sizeof(long) - 1))

struct metadata {
    size_t data_size: 63;
    int is_free;
};

void split_block (struct metadata *block, size_t size) {

    struct metadata *new_block = (struct metadata *)((char *)(block + 1) + size);
    new_block->data_size = block->data_size - size - sizeof(struct metadata);
    new_block->is_free = 1;
    block->data_size = size;

}

static struct metadata *head;
//static struct metadata *free_list;

void *mymalloc (size_t size) {

    if (size == 0) return NULL;

    size = alignSize(size);

    struct metadata *block = head;

    // Traversal of the list of metadata blocks to reuse available blocks
    while (block && ((void *)block < sbrk(0))) {

        if (block->is_free && block->data_size >= size) {  // Found a free block with enough space, reuse it
            split_block(block, size);
            block->is_free = 0;
            return (void *)(block + 1); // Return the pointer to the next available block
        }

        block = nextBlock(block);

    }

    // No free block found or no block with enough space, allocate new memory
    block = sbrk(0);
    void *ptr = sbrk(size + sizeof(struct metadata));

    if (ptr == (void *)-1) return NULL;

    // Metadata for the allocated block
    block->is_free = 0;
    block->data_size = size;

    // First Iteration
    if (head == NULL) {
        head = block;
    }

    return block + 1;
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
    struct metadata *free_block = ptr - sizeof(struct metadata);
    free_block->is_free = 1;

    // Coalescence of free blocks
    struct metadata *current_block = head;
    while ((void *)current_block < sbrk(0)) {
        
        struct metadata *next_block = nextBlock(current_block);

        if (current_block->is_free && next_block->is_free && (void *)next_block < sbrk(0)) {
            current_block->data_size += next_block->data_size + sizeof(struct metadata);
        } else {
            current_block = next_block;
        }
 
    }

}

void *myrealloc(void *ptr, size_t new_size) {

    if (ptr == NULL) {
        return mymalloc(new_size);
    }

    if (new_size == 0) {
        myfree(ptr);
        return NULL;
    }

    size_t total_size = sizeof(struct metadata) + new_size;
    total_size = (total_size + sizeof(long) - 1) & ~(sizeof(long) - 1);

    struct metadata *metadata = ptr - sizeof(struct metadata);

    if (metadata->data_size >= new_size) {
        return ptr;
    } else {

        void *new_ptr = mymalloc(new_size);
        memcpy(new_ptr, ptr, metadata->data_size);
        myfree(ptr);
        return new_ptr;

    }
}

/*
 * Enable the code below to enable system allocator support for your allocator.
 * Doing so will make debugging much harder (e.g., using printf may result in
 * infinite loops).
 */
 #if 1
void *malloc(size_t size) { return mymalloc(size); }
void *calloc(size_t nmemb, size_t size) { return mycalloc(nmemb, size); }
void *realloc(void *ptr, size_t size) { return myrealloc(ptr, size); }
void free(void *ptr) { myfree(ptr); }
#endif

