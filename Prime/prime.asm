global Prime                   
section .text

Prime:                         
    xor r10, r10;               ; Initialize r10 to zero (counter)
    cmp rsi, $0;                ; Compare rsi with 0 (check if there are no numbers to check)
    je finish;                  ; If equal, jump to finish
    mov rcx, [rdi];             ; Load the first number from the array

next1:                          
    cmp rcx, $0;                ; Check if num is 0
    jz next2;                   ; If equal, jump to next2
    cmp rcx, $1;                ; Check if num is 1
    jz next2;                   ; If equal, jump to next2
    cmp rcx, $2;                ; Check if num is 2
    jz yesCheckPrime;           ; If equal, jump to yesCheckPrime
    cmp rcx, $3;                ; Check if num is 3
    jz yesCheckPrime;           ; If equal, jump to yesCheckPrime
    mov r8, $1;                 ; Initialize r8 to 1 (start the divisor from 2)
    mov r9, rcx;                ; Copy rcx to r9
    sub r9, $1;                 ; Subtract 1 from r9 to set the limit for checking primes

CheckPrime:                    
    add r8, $1;                 ; Increment the divisor
    mov rax, rcx;               ; Copy rcx to rax
    mov rbx, r8;                ; Copy r8 to rbx (current divisor)
    mov rdx, $0;                ; Clear rdx (remainder)
    idiv rbx;                   ; Divide rax by rbx, result in rax, remainder in rdx
    cmp rdx, $0;                ; Check if remainder is 0
    jz next2;                   ; If equal, jump to next2
    cmp r8, r9;                 ; Check if the divisor has reached the limit
    je yesCheckPrime;           ; If equal, jump to yesCheckPrime
    jne CheckPrime;             ; If not equal, continue the loop

yesCheckPrime:                 
    add r10, $1;                ; Increment the prime count
    jmp next2;                  ; Jump to next2

next2:                         
    dec rsi;                    ; Decrement the counter for the number of elements
    cmp rsi, $0;                ; Check if there are no more numbers to check
    jz finish;                  ; If equal, jump to finish
    add rdi, $8;                ; Move to the next element in the array
    mov rcx, [rdi];             ; Load the next number from the array
    jmp next1;                  ; Jump back to next1 for the next iteration

finish:                         
    mov rax, r10;               ; Move the count of prime numbers to rax
    ret                         ; Return from the function
