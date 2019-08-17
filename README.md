# Introduction

The purpose of this project is to compare the performance of multiple different programming languages, when attempting to find the value of pi via plotting random points.

# Results on Macbook Pro
Here are the results I found:

- Python
    - Python: 282s
    - Python3: 367s
    - Numba, Numpy: 11s
- Java: 33s
- Julia: 2.6s
- Haskell: 102s

## Machine specs
```
                    'c.          phil@phils-MBP.local
                 ,xNMM.          --------------------
               .OMMMMo           OS: macOS Mojave 10.14.6 18G87 x86_64
               OMMM0,            Host: MacBookPro15,1
     .;loddo:' loolloddol;.      Kernel: 18.7.0
   cKMMMMMMMMMMNWMMMMMMMMMM0:    Uptime: 2 days, 7 hours, 47 mins
 .KMMMMMMMMMMMMMMMMMMMMMMMWd.    Packages: 127 (brew)
 XMMMMMMMMMMMMMMMMMMMMMMMX.      Shell: fish 3.0.2
;MMMMMMMMMMMMMMMMMMMMMMMM:       Resolution: 1680x1050
:MMMMMMMMMMMMMMMMMMMMMMMM:       DE: Aqua
.MMMMMMMMMMMMMMMMMMMMMMMMX.      WM: Quartz Compositor
 kMMMMMMMMMMMMMMMMMMMMMMMMWd.    WM Theme: Blue (Light)
 .XMMMMMMMMMMMMMMMMMMMMMMMMMMk   Terminal: iTerm2
  .XMMMMMMMMMMMMMMMMMMMMMMMMK.   Terminal Font: FiraCode-Medium 12
    kMMMMMMMMMMMMMMMMMMMMMMd     CPU: Intel i7-8850H (12) @ 2.60GHz
     ;KMMMMMMMWXXWMMMMMMMk.      GPU: Intel UHD Graphics 630, Radeon Pro 560X
       .cooc,.    .,coo:.        Memory: 11034MiB / 16384MiB
```

# Results on Windows Desktop

- Julia: 3.010240 seconds (200.82 k allocations: 10.844 MiB)
- Typescript: 20.67s user 0.48s system 100% cpu 21.000 total
- Python w/ Numba: 10.44s user 0.69s system 103% cpu 10.746 total
- Crystal: 7.83s user 0.11s system 99% cpu 7.961 total
- Java: 38.48s user 0.08s system 99% cpu 38.665 total