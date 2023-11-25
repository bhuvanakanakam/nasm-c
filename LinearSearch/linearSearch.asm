global searchN                  ; Declare searchN as a global function

section .text

searchN:                         ; Start of the searchN function
    xor rax, rax;                ; Set rax to zero
    xor rcx, rcx;                ; Set rcx to zero

search_loop:                     ; Start of the search loop
    cmp rcx, rsi;                ; Compare rcx with rsi (length of the array)
    je  element_not_found;        ; If equal, jump to element_not_found

    add rdi, $8;                 ; Increment rdi by 8 to move to the next element in the array
    mov r8, [rdi];               ; Load the value at the memory address stored in rdi into r8
    cmp r8, rdx;                 ; Compare the value in r8 with rdx (the element to search for)
    je  element_found;           ; If equal, jump to element_found

    inc rcx;                     ; Increment rcx (counter for the loop)
    jmp search_loop;             ; Jump back to search_loop

element_found:                   ; Code executed when the element is found
    mov rax, rcx;                ; Move the value in rcx (index) to rax
    add rax, $2;                 ; Add 2 to rax
    ret                           ; Return with the index of the found element

element_not_found:               ; Code executed when the element is not found
    xor rax, -1;                 ; Set rax to -1 (indicating element not found)
    ret                           ; Return with the result
