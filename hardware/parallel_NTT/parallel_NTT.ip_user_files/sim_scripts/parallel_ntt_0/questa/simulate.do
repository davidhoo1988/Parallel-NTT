onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib parallel_ntt_0_opt

do {wave.do}

view wave
view structure
view signals

do {parallel_ntt_0.udo}

run -all

quit -force
