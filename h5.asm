%include "asm_io.inc"
%assign SYS_EXIT 1

segment .data
    welcome_message     db          "kill me know, homework 4", 0

    prompt_number       db          "Enter a number: ", 0
    sum_odd             db          "Question 1 Sum of odd: ", 0
    mult_three          db          "Question 2 Multiplied by 3: ", 0
    sum_even            db          "Question 3 Sum of even: ", 0
    question_4          db          "Question 4 mod 10: ", 0
    question_5          db          "Question 5 compare with 0: ", 0

segment .bss
    input1      resd    1
    input2      resd    1
    array       resd    11


SECTION .txt
    global asm_main
asm_main:
    enter       0,0
    pusha

    mov         eax, welcome_message
    call        print_string
    call        print_nl

    ;testing reverse for loop
    mov         eax, 0
    mov         ebx, 10
    mov         ecx, array

;user input
reverse_for_loop:
    cmp         ebx, 0
    jl          loop_end
    mov         eax, ebx
    call        print_int
    call        print_nl
    dec         ebx

    ;get user input
    mov         eax, prompt_number
    call        print_string
    call        read_int

    ;put user input into the array
    mov         [ecx], eax
    add         ecx, 4
    jmp         reverse_for_loop
loop_end:

    ;array setup
    mov         ecx, array          ;set ecx to point to array
    mov         ebx, 10             ;count down from 11

;adding odd and even numbers
adding_loop:
    mov         eax, [ecx]          ;move array position into eax
    add         [input1], eax       ;add current odd input into input1
    ;call        print_int
    ;call        print_nl
    add         ecx, 4              ;move ecx pointer 4 bytes to next position

    mov         eax, ebx
    ;call        print_int
    ;call        print_nl
    ;call        print_nl
    dec         ebx                 ;decrement ebx

    cmp         ebx, 0              ;end loop if ebx is 0
    jl          adding_loop_end


    mov         eax, [ecx]          ;move array position into eax
    add         [input2], eax       ;move current even position into intpu2
    ;call        print_int
    ;call        print_nl
    add         ecx, 4              ;move ecx pointer 4 bytes to next position

    mov         eax, ebx
    ;call        print_int
    ;call        print_nl
    ;call        print_nl
    dec         ebx

    cmp         ebx, 0              ;end loop if ebx is 0
    jl          adding_loop_end

    jmp         adding_loop
adding_loop_end:


    ; Question 1. sum of odd numbers
    mov         eax, sum_odd        ;print total of odd numbers
    call        print_string
    mov         eax, [input1]
    call        print_int
    call        print_nl


    ; Question 2. multiply the result by 3
    mov         eax, mult_three
    call        print_string

    mov         eax, [input1]
    imul        eax, 3
    mov         [input1], eax

    call        print_int
    call        print_nl

    ;3. add the digit sum at even-numbered positions (second, fourth ...) to the result
    mov         eax, sum_even
    call        print_string

    mov         eax, [input1]
    add         eax, [input2]
    mov         [input1], eax
    call        print_int
    call        print_nl

    ;4. find the result modulo 10 and call it M
    mov         eax, question_4
    call        print_string

    mov         eax, [input1]
    mov         ecx, 10
    cdq
    idiv        ecx
    mov         eax, edx
    mov         [input1], eax
    call        print_int
    call         print_nl


    ;5. if M is zero, then the check digit is 0
    mov         eax, question_5
    call        print_string

    mov         eax, [input1]
    cmp         eax, 0
    jz          false
    mov         ebx, 10
    sub         ebx, [input1]
    mov         eax, ebx
    jmp         true

    false:
    call        print_int
    call        print_nl

    true:
    call        print_int
    call        print_nl

        ;otherwise the check digit is 10 - M
    popa
    mov         eax, 0
    leave
    ret
