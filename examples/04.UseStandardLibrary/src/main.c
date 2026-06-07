#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

#define NUM_THREADS 4
#define ARRAY_SIZE 1000000

typedef struct {
    int thread_id;
    double* array;
    long start;
    long end;
} ThreadArgs;

void* compute_square_sum(void* arg)
{
    ThreadArgs* args = (ThreadArgs*)arg;
    double local_sum = 0.0;
    
    for (long i = args->start; i < args->end; i++) {
        local_sum += args->array[i] * args->array[i];
    }
    
    return NULL;
}

int main(int argc, char **argv)
{
    printf("Hello, world!\n");

    pthread_t threads[NUM_THREADS];
    ThreadArgs thread_args[NUM_THREADS];
    double* data_array = malloc(ARRAY_SIZE * sizeof(double));
    
    for (int i = 0; i < ARRAY_SIZE; i++) {
        data_array[i] = (double)rand() / RAND_MAX;
    }
    
    long chunk_size = ARRAY_SIZE / NUM_THREADS;
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_args[i].thread_id = i;
        thread_args[i].array = data_array;
        thread_args[i].start = i * chunk_size;
        thread_args[i].end = (i == NUM_THREADS - 1) ? ARRAY_SIZE : (i + 1) * chunk_size;
        
        if (pthread_create(&threads[i], NULL, compute_square_sum, &thread_args[i]) != 0) {
            perror("Failed to create thread");
            exit(EXIT_FAILURE);
        }
    }
    
    for (int i = 0; i < NUM_THREADS; i++) {
        if (pthread_join(threads[i], NULL) != 0) {
            perror("Failed to join thread");
            exit(EXIT_FAILURE);
        }
    }
    
    printf("Array size: %d elements\n", ARRAY_SIZE);
    printf("All threads completed successfully!\n");
    
    free(data_array);
    return 0;
}