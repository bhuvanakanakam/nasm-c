global modeN           ; Specifies that the function is global and can be accessed from outside

section .text          ; Indicates that the following lines of code belong to the text (executable) section

modeN:                 ; Defines the label for the modeN function

    mov r10, [rdi]     ; Moves the value at the memory address stored in rdi to r10 (initializing r10 with the first element of the array)
    cmp rsi, $1        ; Compares the value in rsi with 1 (checking if the length of the array is 1)
    je finish;         ; Jumps to 'finish' if the length of the array is 1

    xor r8, r8         ; Clears the value in r8 (used for storing the maximum count)
    xor r9, r9         ; Clears the value in r9 (used for counting occurrences)

    mov r13, $1        ; Initializes r13 to 1 (used as the index for the outer loop)

i_loop:                ; Label for the outer loop
    mov rbx, rdi       ; Copies the value of rdi to rbx (storing the address of the current element)
    xor r9, r9         ; Clears the value in r9 (resetting the count for the current element)

    cmp r13, rsi       ; Compares the value in r13 with rsi (checking if the end of the array is reached)
    je finish;         ; Jumps to 'finish' if the end of the array is reached

    inc r13;           ; Increments the value in r13 (moving to the next element)

    mov r14, $1        ; Initializes r14 to 1 (used as the index for the inner loop)
    mov rdx, rbx       ; Copies the value of rbx to rdx (storing the address of the current element for the inner loop)

j_loop:                ; Label for the inner loop
    add rdx, $8;       ; Moves to the next element in the array (incrementing the pointer by 8 bytes, assuming 64-bit integers)

    cmp r14, rsi;      ; Compares the value in r14 with rsi (checking if the end of the array is reached for the current element)
    je check_and_update;  ; Jumps to 'check_and_update' if the end of the array is reached for the current element

    inc r14;           ; Increments the value in r14 (moving to the next element in the inner loop)

    mov r11, [rdx];    ; Loads the value at the memory address stored in rdx to r11 (current element's value)
    mov r12, [rbx];    ; Loads the value at the memory address stored in rbx to r12 (value of the element to compare)

    cmp r11, r12;      ; Compares the values of r11 and r12 (checking if the current element matches the element to compare)
    je add_count;      ; Jumps to 'add_count' if the elements match
    jne j_loop;        ; Jumps back to 'j_loop' if the elements do not match

add_count:             ; Label to increment the count
    add r9, $1;        ; Increments the count of the current element
    jmp j_loop;        ; Jumps back to 'j_loop' to continue the inner loop

check_and_update:      ; Label to check the count and update the mode
    cmp r8, r9;        ; Compares the value in r8 with r9 (checking if the current count is greater than the maximum count)
    jl update;         ; Jumps to 'update' if the current count is greater than the maximum count

    add rdi, $8;       ; Moves to the next element in the array (incrementing the pointer by 8 bytes)
    jmp i_loop;        ; Jumps back to 'i_loop' to continue the outer loop

update:                ; Label to update the mode
    mov r8, r9;        ; Updates the maximum count with the current count
    mov r10, [rdi];    ; Updates the mode with the current element

    add rdi, $8;       ; Moves to the next element in the array (incrementing the pointer by 8 bytes)
    jmp i_loop;        ; Jumps back to 'i_loop' to continue the outer loop

finish:                ; Label for the end of the function
    mov rax, r10;      ; Moves the value in r10 to rax (preparing to return the mode)
    ret                 ; Returns from the function
