`define ROLLO_I_128 1
`define READ_FIRST 1

`ifdef Obselete_Param
	`ifdef ROLLO_I_128
		`define N 47
		`define M 79
		`define R 5
		`define D 6
	`elsif ROLLO_I_192
		`define N 53
		`define M 89
		`define R 6
		`define D 7
	`elsif ROLLO_I_256
		`define N 67
		`define M 113
		`define R 7
		`define D 8
	`elsif ROLLO_II_128
		`define N 149
		`define M 83
		`define R 5
		`define D 8
	`elsif ROLLO_II_192
		`define N 151
		`define M 107
		`define R 6
		`define D 8
	`elsif ROLLO_II_256
		`define N 157
		`define M 127
		`define R 7
		`define D 8
	`elsif ROLLO_III_128
		`define N 47
		`define M 101
		`define W 5
		`define Wr 6
	`elsif ROLLO_III_192
		`define N 59
		`define M 107
		`define W 6
		`define Wr 8
	`elsif ROLLO_III_256
		`define N 67
		`define M 131
		`define W 7
		`define Wr 8
	`endif
`else
	`ifdef ROLLO_I_128
		`define N 83
		`define M 67
		`define R 7
		`define D 8
	`elsif ROLLO_I_192
		`define N 97
		`define M 79
		`define R 8
		`define D 8
	`elsif ROLLO_I_256
		`define N 113
		`define M 97
		`define R 9
		`define D 9
	`elsif ROLLO_II_128
		`define N 189
		`define M 83
		`define R 7
		`define D 8
	`elsif ROLLO_II_192
		`define N 193
		`define M 97
		`define R 8
		`define D 8
	`elsif ROLLO_II_256
		`define N 211
		`define M 97
		`define R 8
		`define D 9
	`endif
`endif

`define DIGIT 5