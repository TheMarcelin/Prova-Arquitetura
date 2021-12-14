
# int main(){
# int c[20] = {12, 0, 1, 2, 3, 2, 8, 10, 13, 27, 18, -10, 9, 15, -66, 0, 66, 99, 77, 88};
#    int a = 0, b = 30;
#    a = b + c[10];
#    if(a == b) c[10] = a; 
#    else c[10] = b;
#    for(int i = 0; i < 10; i++){
#         b = b - i;
#         c[i] = b;
#   }
#}


.data
c: .word 12, 0, 1, 2, 3, 2, 8, 10, 13, 27, 18, -10, 9, 15, -66, 0, 66, 99, 77, 88
.text

la $s0, c
add $s1,$zero,$zero
addi $s2,$zero,30

lw $t0, 40($s0)
add $s1, $s2, $t0
beq $s1, $s2, condition
sw $s2, 40($s0)
j next
condition: sw $s1, 40($s0) 
next:

loop: 	addi $t1, $t1, 0
	addi $t2, $zero, 10
	add $t5, $t1, $t1
	add $t5, $t5, $t5
	add $t3, $t5, $s0
	sub $s2, $s2, $t1
	sw $s2,0($t3)
	addi $t1, $t1, 1
	bne $t1,$t2, loop	
	
#2 - Escolha 3 comandos, um de cada tipo (R, I e J), e converta o código para linguagem de máquina. 
#Considere para todos os casos que o OPCODE = 32 e o OPULA(caso exista) = 8.

#(R-type)
sub $t4, $s2, $t1
  OP  - RS  -  RT -  RD -SHAMT- FUNCT
100000 10010 01001 01100 00000 100010

#(I-type)
addi $t1, $t1, 0
  OP  - RS  -  RT - ADDRESS
100000 01001 01001 0000000000000000  

#(J-type)
j next
OP - ADDRESS
100000 00000000000000000000000000
