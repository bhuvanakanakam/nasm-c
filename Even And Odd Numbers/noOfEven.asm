; Function to count the number of even numbers in an array

global numEven         ; Declare the function as global with the name 'numEven'
section .text          ; Start the text section

numEven:               ; Label for the numEven function
    xor rax, rax       ; Clear the accumulator rax (initialize to zero)
    cmp rsi, 0          ; Compare the second parameter (array size) with 0
    je finish           ; If the array size is 0, jump to the finish label

next1:                  ; Label for the first loop
    mov rcx, [rdi]      ; Load the value at the memory address in rdi into rcx (assume 8-byte integers)
    and rcx, 1          ; Perform bitwise AND with 1 to check if the number is even (if the result is 0, it's even)
    jz next2            ; Jump to next2 if the number is even
    inc rax             ; Increment the count of even numbers

next2:                  ; Label for the second part of the loop
    dec rsi             ; Decrement the array size
    jz finish           ; If the array size is 0, jump to the finish label
    add rdi, 8          ; Move to the next 8-byte element in the array (assuming 8-byte integers)
    jmp next1           ; Jump back to next1 to continue the loop

finish:                 ; Label for the end of the function
    ret                ; Return from the function
