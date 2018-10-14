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
    input2      resd    2

SECTION .txt
    global asm_main
asm_main:
    enter       0,0
    pusha

    mov         eax, welcome_message
    call        print_string
    call        print_nl

    ; Get input
    ;1. sum the digits at odd-numbered positions (first, third, fifth, .... eleventh)
    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    mov         [input1], eax       ; 1. store into input1

    mov         eax, prompt_number
    call        print_string

    call        read_int
    mov         [input2], eax      ; 2. store into input2

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input1], eax       ; 3. adding odd input numbers

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input2], eax      ; 4. adding even input numbers

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input1], eax       ; 5. adding odd input

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input2], eax      ; 6. adding even input numbers

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input1], eax       ; 7. adding odd input

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input2], eax      ; 8. adding even input numbers

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input1], eax       ; 9. adding odd input

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input2], eax      ; 10. adding even input numbers

    mov         eax, prompt_number   ; print out prompt
    call        print_string

    call        read_int
    add         [input1], eax       ; 11. adding odd input

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
