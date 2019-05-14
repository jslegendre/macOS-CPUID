# macOS-CPUID
Using CPUID opcode on macOS

## Quick and Dirty
The source code on the [Wikipedia entry for CPUID](https://en.wikipedia.org/wiki/CPUID) will not work if you want to build a 64bit Mach-O file. This is a fork of that code to make it build/function on macOS

## Build
I built this with GCC as the C library is required for `printf`.

`gcc -arch x86_64 -e _main cpuid.s -o cpuid`
