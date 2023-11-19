
global noeven
section .text
noeven:
        xor rax,rax;
        cmp rsi,$0; 
        je finish;
        mov rcx,[rdi]
next1:
        and rcx,$1;      checking least significant bit is 0 or 1
        jnz next2;       jump if not zero 
        inc rax;         if zero increment rax by 1
next2:
        dec rsi;
        jz finish;
        add rdi,$8;
        mov rcx,[rdi];
        jmp next1;
finish:
        ret
