#COMP7615 Homework2
#makefile

#compile program with dependencies
h4: driver.c asm_io.o h4.o
	gcc -o h4 -m32 driver.c asm_io.o h4.o

#create assmebly io object
asm_io.o: asm_io.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm

#create name banner object
h4.o: h4.asm
	nasm -f elf32 -d ELF_TYPE h4.asm


