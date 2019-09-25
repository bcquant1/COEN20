.syntax unified
.cpu cortex-m4
.text

//int32_t MxPlusB(int32_t x, int32_t mtop, int32_t mbtm, int32_t b) ;
.global MxPlusB
.thumb_func
.align
MxPlusB:
	PUSH {R4,R5}
		MUL R1,R0,R1 //multiplying x and mtop = dvnd
		SMULL R5,R4,R1,R2 //dvdn*divisor
		ASR R4,R4,31 //(dvdn*divisor) >> 31
		MUL R4,R4,R2 // ((dvdn*divisor) >> 31) * dvsr
		LSL R4,R4,1 // (((dvdn*divisor) >> 31) * dvsr << 1)
		ADDS R4,R4,R2 // (((dvdn*divisor) >> 31) * dvsr << 1) + dvsr
		LDR R5, =2 //loading 2 into register 5
		SDIV R4,R4,R5 // ((((dvdn*divisor) >> 31) * dvsr << 1) + dvsr )/2) = rounding
		ADDS R4,R4,R1 // (dvnd + rounding)
		SDIV R4,R4,R2 // (dvnd + rounding)/dvsr = mx
		ADDS R0,R4,R3 // mx + b
	POP {R4,R5}
	BX LR
