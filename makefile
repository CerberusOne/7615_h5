#COMP7615 Homework2
#makefile

#compile program with dependencies
h5: driver.c asm_io.o h5.o
	gcc -o h5 -m32 driver.c asm_io.o h5.o

#create assmebly io object
asm_io.o: asm_io.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm

#create name banner object
h5.o: h5.asm
	nasm -f elf32 -d ELF_TYPE h5.asm


