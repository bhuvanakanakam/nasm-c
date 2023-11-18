section .text
global maximum

; first parameter in rdi (pointer to the array)
; second parameter in rsi (number of elements in the array)

maximum:
    cmp rsi, 0          ; Check if there are no elements
    je finish           ; If so, jump to finish
    mov rax, [rdi]      ; Load the first element into rax
next:
    cmp rax, [rdi]      ; Compare rax with the current element
    jl trans            ; Jump to trans if the current element is less than rax
    add rdi, 8          ; Move to the next element (assuming 8 bytes per element)
    dec rsi             ; Decrement the count of remaining elements
    cmp rsi, 0          ; Check if all elements have been processed
    je finish           ; If so, jump to finish
    jmp next            ; Continue with the next iteration
trans:
    mov rax, [rdi]      ; Update rax with the current element
    cmp rsi, 0          ; Check if all elements have been processed
    jne next            ; If not, continue with the next iteration
finish:
    ret
