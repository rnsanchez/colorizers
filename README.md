# colorizers
Assorted (eventually) scripts for colorizing output from select tools

## objdump

Usage:

- `objdump -Sdl /lib64/libpthread.so.0 | awk/objdump.awk | less -R`

![Alt text](/awk/objdump-example.png?raw=true "Colorized output from objdump")
