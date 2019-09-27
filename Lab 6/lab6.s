.syntax unified
.cpu cortex-m4
.text

.set Bitband, 1

//BOOL GetBit (uint16_t *bits, uint32_t row, uint32_t col)
.global GetBit
.thumb_func
.align
.ifdef BITBAND

GetBit:
	SUB R0,R0, 0x2000000
	LSLS.N R0,R0,5
	ADD R1,R2,R1,LSL 2
	ADD R0,R0, 0x22000000
	LDR R0,[R0,R1,LSL 2]
	BX LR
	.else
	
GetBit:
	LDRH R0,[R0]
	ADD R3,R2,R1,LSL 2
	LSR R0,R0,R3
	AND R0,R0,1
	BX LR
.endif

//void PutBit(BOOL value, uint16_t *bits, uint32_t row, uint32_t col)
.global PutBit
.thumb_func
.align
.ifdef BITBAND

PutBit:
	SUB R0,R0, 0x2000000
	LSLS.N R1,R1,5
	ADD R2,R3,R2,LSL 2
	ADD R1,R1, 0x22000000
	STR R0,[R1,R2,LSL 2]
	BX LR
	.else

PutBit:
	ADD R2,R3,R2, LSL 2
	LDR R3, = 1
	LSL R3,R3,R2
	LSL R0,R0,R2
	LDRH R2,[R1]
	BIC R2,R2,R3
	ORR R2,R0,R2
	STRH R2,[R1]
	BX LR
	.endif
