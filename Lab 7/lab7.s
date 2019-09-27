.syntax unified
.cpu cortex-m4
.text

//uint32_t Times45(uint32_t mcnd)
.global Times45
.thumb_func
.align
Times45:
	ADD R1,R0,R0,LSL 1
	RSB R0,R1,R1,LSL 4
	BX LR
	
	
	
//uint32_t Times55(uint32_t mcnd)
.global Times55
.thumb_func
.align
Times55:
	ADD R1,R0,R0,LSL 3
	RSB R0,R1,R0,LSL 6
	BX LR
	
//uint32_t Times106(uint32_t mcnd)
.global Times106
.thumb_func
.align
Times106:
	RSB R1,R0,R0,LSL 4
	RSB R1,R1,R1,LSL 3
	ADD R0,R0,R1
	BX LR
	
//uint32_t Times43691(uint32_t mcnd)
.global Times43691
.thumb_func
.align
Times43691:
	ADD R1,R0,R0,LSL 2
	ADD R1,R1,R1,LSL 4
	ADD R1,R1,R1,LSL 8
	ADD R0,R0,R1, LSL 1
	BX LR
	
	
