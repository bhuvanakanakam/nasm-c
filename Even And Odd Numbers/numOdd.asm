global numOdd
section .text
numOdd:
        xor rax, rax;
        cmp rsi, $0;
        je finish;
        mov rcx, [rdi];
next1:
        and rcx, $1;
        jz next2;
        inc rax;
next2:
        dec rsi;
        jz finish;
        add rdi, $8;
        mov rcx, [rdi];
        jmp next1;
finish:
        ret