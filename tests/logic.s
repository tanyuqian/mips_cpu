.org 0x0  
.set noat  
.set noreorder       
.set nomacro          
.global _start 

_start:
	 ori  	$1, $0, 0x000f		# $1 = 0x000f
	 ori  	$2, $0, 0x00f0		# $2 = 0x00f0
	 ori  	$3, $0, 0x0f00		# $3 = 0x0f00
	 ori	$4, $0, 0xf000		# $4 = 0xf000
	 
	 or		$5, $1, $2			# $5 = 0x00ff
	 or 	$6, $5, $3			# $6 = 0x0fff
	 or		$7, $6, $4			# $7 = 0xffff
	 
	 xori	$4, $1, 0x0000		# $4 = 0x000f
	 xori	$3, $2, 0x0000		# $3 = 0x00f0
	 xor	$2, $5, $6			# $2 = 0x0f00
	 xor	$1, $6, $7			# $1 = 0xf000
	 
	 and	$7, $7, $6			# $7 = 0x0fff
	 and	$7, $7, $5			# $7 = 0x00ff
	 and 	$7, $7, $4			# $7 = 0x000f
	 andi	$7, $7, 0x0000		# $7 = 0x0000