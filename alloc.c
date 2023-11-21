#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define nextBlock(currentBlock) ((struct metadata *)((char *)(currentBlock + 1) + currentBlock->data_size))

struct metadata {
    size_t data_size: 63;
    struct metadata *next;
    int is_free;
};

// void split_block (struct metadata *block, size_t size) {

//     int32_t remaining_size = block->data_size - size;
    
//     if (remaining_size >= 0) {

//         struct metadata *new_block = (struct metadata *)((char *)block + size + sizeof(struct metadata));
//         new_block->next = block->next;
//         new_block->is_free = 1;
//         new_block->data_size = remaining_size;
//         block->next = new_block;
//         block->data_size = size;

//     }

// }

// struct metadata *nextBlock(struct metadata *currentBlock) {
//     return (struct metadata *)((char *)(currentBlock + 1) + currentBlock->data_size);
// }

static struct metadata *head;
static struct metadata *free_list;

void *mymalloc (size_t size) {

    if (size == 0) return NULL;

    if (size % 8 != 0) {
        size = size + (8 - size % 8);
    } 

    struct metadata *block = head;
    //struct metadata *free_block = free_list;

    // Traversal of the list of metadata blocks to reuse available blocks
    while (block != NULL) {

        if (block->is_free && block->data_size >= size) {  // Found a free block with enough space, reuse it
            //split_block(block, size_in_bytes);
            block->is_free = 0;
            return (void *)(block + 1); // Return the pointer to the next available block
        }

        block = block->next;

    }

    // while (free_block != NULL) {

    //     if (free_block->is_free && free_block->data_size >= size_in_bytes) {
    //         free_block->is_free = 0;
    //         return (void *)(free_block + 1);
    //     }

    //     free_block = free_block->next;

    // }

    // No free block found or no block with enough space, allocate new memory
    block = sbrk(0);
    void *ptr = sbrk(size + sizeof(struct metadata));

    if (ptr == (void *)-1) return NULL;

    // Metadata for the allocated block
    block->next = NULL;
    block->is_free = 0;
    block->data_size = size;

    if (head != NULL) {

        struct metadata *current_block = head;
        while (current_block->next != NULL) {
            current_block = current_block->next;
        }
        current_block->next = block;

    }

    // First Iteration
    if (head == NULL) {
        head = block;
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
    struct metadata *free_block = ptr - sizeof(struct metadata);
    free_block->is_free = 1;

    // Coalescence of consecutive free blocks
    if (free_block->next && free_block->next->is_free) {
        free_block->data_size += free_block->next->data_size + sizeof(struct metadata);
    }

    // Traversal and placement of new free blocks
    struct metadata *free_list_head = free_list;
    
    if (free_list_head  != NULL) {
        
        struct metadata *current_free_block = free_list_head;
        while (current_free_block->next != NULL) {
            current_free_block = current_free_block ->next;
        }

        current_free_block->next = free_block;

    }

    if (free_list_head == NULL) {
        free_list_head = free_block;
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