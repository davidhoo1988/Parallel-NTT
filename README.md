# NTT hardware architecture based on hypercube topology

The structure of this project consists of 3 main parts including:

## manuscript
A research paper describing the algorithms and the hardware is under this directory.


## python
Two python-3.0 scripts hypercube.py and NTT.py are under this directory.

### NTT.py
This program implements both NTT (a.k.a ntt_forward) and inverse NTT (a.k.a ntt_backward) operations in several different styles, for example, GS-butterfly type and CT-butterfly type.


### hypercube.py
This program implements the parallelized NTT on top of hypercube which simulates the behavior of NTT hardware. The NTT type can be 'NR' (input is in natural order and the output is in reversed order) or 'RN' (input is in reversed order and the output is in natural order)



## hardware
A reference rtl design is under "Parallel_NTT\hardware\ip_repo\parallel_ntt_2.0\src", including:

parallel_NTT_top.v: the top mudule for 'NR' NTT. NTT configuration is N = 1024 points, q = 32-bit prime,  d = 4 ntt-processors

NTT_processor.v: the processing element (PE) for butterfly computation

Barret_reduce.v: the computational module for computing 'mod q'

mem_dp.v: self-written module for dual-port block memory

mem_sp.v: self-written module for single-port block memory


### auto-generation tool
It is worth noting that parallel_NTT_top.v and NTT_processor.v are highly configurable depending on the value of N, d, q. An auto-generation tool, i.e. 'auto_gen.py' for these files can be found in 'Parallel_NTT\hardware\ip_repo\parallel_ntt_2.0\src\scripts'. After running auto_gen.py successfully, the generated files can be found at "Parallel_NTT\hardware\ip_repo\parallel_ntt_2.0\src\scripts\verilog"