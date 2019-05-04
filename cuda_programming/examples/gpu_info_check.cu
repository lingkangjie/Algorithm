/*
 * reference: CUDA Samples deviceQuery.cpp
 * Compiling: $ nvcc gpu_info_check.cu
 * 
 */

// CUDA-C includes
#include <cuda.h>
#include <cuda_runtime.h>

#include "./utils/book.h"

int main( void ) {


    int count;
    HANDLE_ERROR( cudaGetDeviceCount( &count ) ); // get devices number
    int driverVersion = 0, runtimeVersion = 0;
    for (int i=0; i< count; i++) {

        cudaSetDevice(i); // set the device to query
        cudaDeviceProp  deviceProp;
        HANDLE_ERROR( cudaGetDeviceProperties( &deviceProp, i ) );
        printf( "   --- General Information for device %d ---\n", i );
        printf("Device %d: \"%s\"\n", i, deviceProp.name);

        cudaDriverGetVersion(&driverVersion);
        cudaRuntimeGetVersion(&runtimeVersion);

        printf("  CUDA Driver Version / Runtime Version          %d.%d / %d.%d\n", driverVersion/1000, (driverVersion%100)/10, runtimeVersion/1000, (runtimeVersion%100)/10);
        printf("  CUDA Capability Major/Minor version number:    %d.%d\n", deviceProp.major, deviceProp.minor);

        char msg[256];
        sprintf(msg, "  Total amount of global memory:                 %.0f MBytes (%llu bytes)\n",
                (float)deviceProp.totalGlobalMem/1048576.0f, (unsigned long long) deviceProp.totalGlobalMem);
        printf("%s", msg);

        printf( "Compute capability:  %d.%d\n", deviceProp.major, deviceProp.minor );
        printf( "Clock rate:  %d\n", deviceProp.clockRate );
        printf( "Device copy overlap:  " );
        if (deviceProp.deviceOverlap)
            printf( "Enabled\n" );
        else
            printf( "Disabled\n");
        printf( "Kernel execution timeout :  " );
        if (deviceProp.kernelExecTimeoutEnabled)
            printf( "Enabled\n" );
        else
            printf( "Disabled\n" );

        printf( "   --- Memory Information for device %d ---\n", i );
        printf( "Total global mem:  %ld\n", deviceProp.totalGlobalMem );
        printf( "Total constant Mem:  %ld\n", deviceProp.totalConstMem );
        printf( "Max mem pitch:  %ld\n", deviceProp.memPitch );
        printf( "32-bits register per block", deviceProp.regsPerBlock);
        printf( "Texture Alignment:  %ld\n", deviceProp.textureAlignment );

        printf( "   --- MP Information for device %d ---\n", i );
        printf( "Shared mem per mp:  %ld\n", deviceProp.sharedMemPerBlock );
        printf( "Registers per mp:  %d\n", deviceProp.regsPerBlock );
        printf( "Threads in warp:  %d\n", deviceProp.warpSize );
        printf( "Max threads per block:  %d\n",
                    deviceProp.maxThreadsPerBlock );
        printf( "Max thread dimensions:  (%d, %d, %d)\n",
                    deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1],
                    deviceProp.maxThreadsDim[2] );
        printf( "Max grid dimensions:  (%d, %d, %d)\n",
                    deviceProp.maxGridSize[0], deviceProp.maxGridSize[1],
                    deviceProp.maxGridSize[2] );
        printf( "Memory Bus Width in bits: %d\n",deviceProp.memoryBusWidth);
        printf( "\n" );
    }
}
