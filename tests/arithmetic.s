.org 0x0  
.set noat  
.set noreorder       
.set nomacro          
.global _start 

_start:
	addi	$1, $0, 0x0001
	addi	$1, $1, 0x0002
	addi	$1, $1, 0x0003
	addi	$1, $1, 0x0004
	ori		$3, $0, 0x000a
	
	sub		$2, $1, $3
	lui		$2, 0x0101
	add		$3, $2, $1