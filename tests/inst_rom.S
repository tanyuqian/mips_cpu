   .org 0x0
   .set noat
   .set noreorder
   .set nomacro
   .global _start

_start:

   # test pipeline, the cpu should compute one result per cycle
   ori  $1, $0, 0x0020  # $1 = 0x0020
   addi $1, $1, 0x0002  # $1 = 0x0022
   ori  $1, $1, 0x1100  # $1 = 0x1122
   andi $1, $1, 0x0012  # $1 = 0x0002
   xori $1, $1, 0xF012  # $1 = 0xF010

   # test instructions
   ori  $2, $0, 0x1001
   sub  $1, $1, $2      # $1 = 0xE00F
   ori  $2, $0, 0x00FF
   add  $1, $2, $1      # $1 = 0xE10E
   ori  $2, $0, 0x0F00
   and  $1, $1, $2      # $1 = 0x0100
   ori  $2, $0, 0xF10F
   xor  $1, $2, $1      # $1 = 0xF00F

   slti  $1, $1, 0xF010 # $1 = 0x0000   (0xF00F > (sign extend) 0xF010)
   ori   $2, $0, 0x001
   slt   $1, $1, $2     # $1 = 0x0001

   # test memory
   lui  $2, 0xAABB      # $2 = 0xAABB0000
   ori  $2, $2, 0xCCDD  # $2 = 0xAABBCCDD
   sw   $2, 0x08($0)    # mem[8] = 0xAABBCCDD

   xor  $1, $1, $1      # $1 = 0
   ori  $1, $0, 0x08    # $1 = 0x08
   lb   $1, 0x00($1)    # $1 = 0xFFFFFFAA
   ori  $1, $1, 0xF0    # $1 = 0xFFFFFFFA
   sb   $1, 0x08($0)    # mem[8] = 0xFABBCCDD
   lw   $1, 0x08($0)    # $1 = 0xFABBCCDD

   # test jump
   ori  $3, $0, 0x0A    # $3 = 10
   ori  $4, $0, 0x1     # $4 = 1
loop_1:                 # loop 10 * 30 ns = 300ns
   sub  $3, $3, $4      # $3 = $3 - 1
   bne  $3, $0, loop_1
   nop                  # slot

   # restart
   j _start             
   nop
  
# - addi
# - subi
# - andi
# - ori
# - xori
# - lui
# - add
# - sub
# - and
# - or
# - xor
# - slt
# - slti
# - lw
# - sw
# - lb
# - sb
# - bne
# - j
# beq
# jr
