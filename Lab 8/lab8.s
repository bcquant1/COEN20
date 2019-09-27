.syntax unified
.cpu cortex-m4
.text

//float FloatPoly(float x, float a[], int32_t n)
.global FloatPoly
.thumb_func
.align
FloatPoly:
	VSUB.F32 S1,S1,S1
	VMOV S2, 1.0
Loop:
	CMP R1,0
	BEQ Done
	VLDMIA R0!,{S3}
	VMLA.F32 S1,S3,S2
	VMUL.F32 S2,S2,S0
	SUB R1,R1,1
	B Loop
Done:
	VMOV S0,S1
	BX LR
	
	
	
// Q16 FixedPoly (Q16 x, Q16 a[], int32_t n)
.global FixedPoly
.thumb_func
.align
FixedPoly:
	PUSH {R4,R5,R6}
	LDR R3, =0
	LDR R4, =1
	LSL R4,R4,16

	Loop1:
		CMP R2,0
		BEQ Done1
		LDMIA R1!,{R6}
		SMULL R5,R6,R4,R6
		LSR R5,R5,16
		ORR R5,R5,R6,LSL 16
		ADD R3,R3,R5
		SMULL R4,R5,R4,R0
		LSR R4,R4,16
		ORR R4,R4,R5,LSL 16
		SUB R2,R2,1
		B Loop1
	
	Done1:
		MOV R0,R3
		POP {R4,R5,R6}
		BX LR
		
	
	
