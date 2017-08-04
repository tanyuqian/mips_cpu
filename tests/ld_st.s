.org 0x0  
.set noat  
.set noreorder       
.set nomacro          
.global _start 

_start:
	lui		$1, 0x1234
	ori		$1, $1, 0x5678
	ori		$2, $0, 0x0000
	
	sw		$1, 0($2)
	lb		$3,	0($2) 
	lb		$4, 1($2)
	lb		$5, 2($2)
	lb		$6, 3($2)
	
	sb		$3, 3($2)
	sb		$4, 2($2)
	sb		$5, 1($2)
	sb		$6, 0($2)
	
	lw		$1, 0($2)