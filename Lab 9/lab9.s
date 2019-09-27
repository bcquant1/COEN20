.syntax unified
.cpu cortex-m4
.text

//void SIMD_USatAdd(uint8_t bytes[], uint32_t count, uint8_t amount)
.global SIMD_USatAdd
.thumb_func
.align
SIMD_USatAdd:
	PUSH {R4-R11}
	BFI R2,R2,8,8
	BFI R2,R2,16,16
	
Loop:
	CMP R1,40
	BLO Cleanup
	LDMIA R0, {R3-R12}
	UQADD8 R3,R3,R2
	UQADD8 R4,R4,R2
	UQADD8 R5,R5,R2
	UQADD8 R6,R6,R2
	UQADD8 R7,R7,R2
	UQADD8 R8,R8,R2
	UQADD8 R9,R9,R2
	UQADD8 R10,R10,R2
	UQADD8 R11,R11,R2
	UQADD8 R12,R12,R2
	STMIA R0!,{R3-R12}
	SUBS R1,R1,40
	B Loop
	
Cleanup:
	CBZ R1, done
	LDR R3,[R0]
	UQADD8 R3,R3,R2
	STR R3,[R0],4
	SUBS R1,R1,4
	B Cleanup
	
done:
	POP {R4-R11}
	BX LR
	
	
//void SIMD_USatSub(uint8_t bytes[], uint32_t count, uint8_t amount)
.global SIMD_USatSub
.thumb_func
.align
SIMD_USatSub:
	PUSH {R4-R11}
	BFI R2,R2,8,8
	BFI R2,R2,16,16
	
Loop1:
	CMP R1,40
	BLO Cleanup1
	LDMIA R0, {R3-R12}
	UQSUB8 R3,R3,R2
	UQSUB8 R4,R4,R2
	UQSUB8 R5,R5,R2
	UQSUB8 R6,R6,R2
	UQSUB8 R7,R7,R2
	UQSUB8 R8,R8,R2
	UQSUB8 R9,R9,R2
	UQSUB8 R10,R10,R2
	UQSUB8 R11,R11,R2
	UQSUB8 R12,R12,R2
	STMIA R0!,{R3-R12}
	SUBS R1,R1,40
	B Loop1
	
Cleanup1:
	CBZ R1, done1
	LDR R3,[R0]
	UQSUB8 R3,R3,R2
	STR R3,[R0],4
	SUBS R1,R1,4
	B Cleanup1
	
done1:
	POP {R4-R11}
	BX LR
.end
