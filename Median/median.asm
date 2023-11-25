global medianN                 
section .text

medianN:                        ; Start of the medianN function
    mov rax, [rdi];             ; Move the value at the memory address stored in rdi to rax
    cmp rsi, $1;                 ; Compare rsi with 1
    je finish;                   ; If equal, jump to finish

next:                           ; Label for the next section of code
    mov rbx, rsi;               ; Move the value of rsi to rbx
    test rbx, 1;                 ; Test if rbx is odd
    jz even;                    ; If rbx is even, jump to even
    jnz odd;                     ; If rbx is odd, jump to odd

odd:                            ; Code for odd length array
    mov rax, rsi;               ; Move the value of rsi to rax
    add rax, 1;                  ; Add 1 to rax
    mov rbx, 2;                  ; Move the value 2 to rbx
    xor rdx, rdx;                ; Clear rdx
    div rbx;                     ; Divide rax by rbx, result in rax, remainder in rdx
    mov rcx, rax;                ; Move the quotient to rcx
    
    add rsi, 1;                  ; Increment rsi

getelement:                     ; Loop to get elements from the array
    mov rax, [rdi];              ; Move the value at the memory address stored in rdi to rax
    add rdi, $8;                 ; Move to the next element in the array
    dec rsi;                     ; Decrement rsi
    cmp rsi, rcx;                ; Compare rsi with rcx
    jne getelement;              ; If not equal, jump to getelement
    je finish;                   ; If equal, jump to finish

even:                           ; Code for even length array
    mov rax, rsi;                ; Move the value of rsi to rax
    mov rbx, $2;                 ; Move the value 2 to rbx
    xor rdx, rdx;                ; Clear rdx
    div rbx;                     ; Divide rax by rbx, result in rax, remainder in rdx
    mov rcx, rax;                ; Move the quotient to rcx

getelementeven:                 ; Loop to get elements from the array for even length
    dec rsi;                     ; Decrement rsi
    mov rax, [rdi];              ; Move the value at the memory address stored in rdi to rax
    add rdi, $8;                 ; Move to the next element in the array
    cmp rsi, rcx;                ; Compare rsi with rcx
    jne getelementeven;          ; If not equal, jump to getelementeven
    je addnextelement;           ; If equal, jump to addnextelement

addnextelement:                 ; Code to add the next element for even length
    add rax, [rdi];              ; Add the next element in the array to rax
    mov rbx, $2;                 ; Move the value 2 to rbx
    div rbx;                     ; Divide rax by rbx, result in rax, remainder in rdx

finish:                         ; Finish of the function
    ret                          ; Return from the function
