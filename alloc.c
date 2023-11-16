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
        
        char *byte_ptr = (char *)ptr; // Set memory content to zero
        for (size_t i = 0; i < total_size; ++i) {
            byte_ptr[i] = 0;
        }
    }

    return ptr;
}


void myfree(void *ptr) {
   return NULL;
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
