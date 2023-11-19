; Function to calculate (a^3 - b^3) / (a * b)

global Calc
section .text
Calc:
    ; Initialize registers with input values
    mov rax, rdi ; a
    mov rbx, rsi ; b
    xor r10, r10 ; Initialize the answer to 0
    mov r8, rax   ; Copy a to r8
    mov r9, rbx   ; Copy b to r9

    ; Calculate a^2
a_square:
    add r8, rdi   ; r8 += a
    dec rax       ; Decrement a
    cmp rax, 1    ; Check if a is 1
    je a_temp      ; Jump to a_temp if a is 1
    jne a_square  ; Continue the loop if a is not 1

    ; Store a in rax and a^2 in rcx
a_temp:
    mov rax, rdi  ; Copy a to rax
    mov rcx, r8   ; Copy a^2 to rcx

    ; Calculate a^3
a_cube:
    add r8, rcx   ; r8 += a^2
    dec rax       ; Decrement a
    cmp rax, 1    ; Check if a is 1
    je b_square   ; Jump to b_square if a is 1
    jne a_cube    ; Continue the loop if a is not 1

    ; Calculate b^2
b_square:
    add r9, rsi   ; r9 += b
    dec rbx       ; Decrement b
    cmp rbx, 1    ; Check if b is 1
    je b_temp      ; Jump to b_temp if b is 1
    jne b_square  ; Continue the loop if b is not 1

    ; Store b in rbx and b^2 in rcx
b_temp:
    mov rbx, rsi  ; Copy b to rbx
    mov rcx, r9   ; Copy b^2 to rcx

    ; Calculate b^3
b_cube:
    add r9, rcx   ; r9 += b^2
    dec rbx       ; Decrement b
    cmp rbx, 1    ; Check if b is 1
    je a3_b3      ; Jump to a3_b3 if b is 1
    jne b_cube    ; Continue the loop if b is not 1

    ; Calculate a^3 - b^3
a3_b3:
    sub r8, r9    ; r8 - r9, result in r8

    ; Calculate a + b
a_b:
    mov rcx, rdi  ; Copy a to rcx
    mov rdx, rsi  ; Copy b to rdx
    add rcx, rdx  ; rcx = a + b

    ; Calculate (a^3 - b^3) / (a + b)
Div:
    sub r8, rcx   ; r8 - rcx, result in r8
    inc r10       ; Increment the answer
    cmp r8, 0     ; Check if the result is greater than 0
    jg Div        ; Continue the loop if the result is greater than 0
    jle finish    ; Jump to finish if the result is less than or equal to 0

finish:
    ; Return the answer
    mov rax, r10  ; Copy the answer to rax
    ret           ; Return from the function

    

