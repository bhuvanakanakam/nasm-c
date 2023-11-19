global numEven
section .text
numEven:
    xor rax, rax
    cmp rsi, 0
    je finish

next1:
    mov rcx, [rdi]
    and rcx, 1
    jz next2
    inc rax

next2:
    dec rsi
    jz finish
    add rdi, 8
    jmp next1

finish:
    ret
