.syntax unified
.cpu cortex-m4
.text

//void CopyCell(uint32_t *dst, uint32_t *src)
.global CopyCell
.thumb_func
.align
CopyCell:
	PUSH {R4}
	LDR R2, =0
	L1:
		CMP R2,#60
		BHS END;
		LDR R3, =0
	L2:
		CMP R3,#60
		BHS L3
		LDR R4,[R1,R3,LSL 2]
		STR R4,[R0,R3,LSL 2]
		ADD R3,R3, 1
		B L2
	L3: 
		ADD R0,R0,#960
		ADD R1,R1,#960
		ADD R2,R2,1
		B L1
	END:
	POP {R4}
	BX LR
	
	
	
//void FillCell(uint32_t *dst, uint32_t pixel)
.global FillCell
.thumb_func
.align
FillCell:
	LDR R2, =0
	L4:
		CMP R2, #60
		BHS END1;
		LDR R3, =0
	L5:
		CMP R3, #60
		BHS L6
		STR R1,[R0,R3,LSL 2]
		ADD R3,R3, 1
		B L5
	L6: 
		ADD R0,R0, #960
		ADD R2,R2,1
		B L4
	END1:
	BX LR
	
