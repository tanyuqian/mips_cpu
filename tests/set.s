.org 0x0  
.set noat  
.set noreorder       
.set nomacro          
.global _start 

_start:
	ori		$1, $0, 0x0001
	lui		$2, 0x0001
	
	slt		$3, $1, $2
	slti	$4, $1, 0x0100
	slti	$5, $2, 0x0100