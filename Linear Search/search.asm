section .text
global searchN

searchN:
    xor rax, rax        ; Clear rax (will hold the result)
    xor rcx, rcx        ; Clear rcx (counter for loop)

search_loop:
    cmp rcx, rsi        ; Compare current index with the number of elements
    je  element_not_found  ; If all elements are checked, jump to element_not_found

    add rdi, 8          ; Move to the next element (assuming 8 bytes per element)
    mov r8, [rdi]       ; Load the value at the current array element to r8
    cmp r8, rdx         ; Compare the value at the current element with the search value
    je  element_found   ; If found, jump to element_found

    inc  rcx            ; Increment the loop counter
    jmp  search_loop    ; Continue searching for the element

element_found:
    mov rax, rcx        ; Move the index of the found element to rax
    add rax, 2          ; Increment the found index by 2 (assuming 0-based index)
    ret                 ; Return with the index of the found element

element_not_found:
    xor rax, -1         ; Set rax to -1 to indicate element not found
    ret                 ; Return
