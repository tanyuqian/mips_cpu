.org 0x0  
.set noat  
.set noreorder       
.set nomacro          
.global _start 

_start:
	ori		$1, $0, 0x0000		# $1 = 0
	ori		$2, $0, 0x0000		# $2 = 0
	ori		$3, $0, 0x000a		# $3 = 10
	ori		$4, $0, 0x0001		# $4 = 1
	addi	$1, $1, 0x0001		# $1 = 1
	
_l1:
	add		$2, $2, $1			
	add		$1, $1, $4
	bne		$1, $3, _l1
	nop
	
	.org 0x40
_l2:
	beq		$1, $0, _l3
	nop
	sub		$1, $1, $4
	sub		$2, $2, $1
	j 0x40
	
_l3: