global addMat
section .text
addMat:
    cmp rcx,$0;
    jz finish;
next:
    vmovdqu xmm0,[rdi];
    vpaddq xmm0,[rsi];
    vmovdqu [rdx],xmm0;
    add rdi,16;
    add rsi,16;
    add rdx,16;
    sub rcx,2;
    jnz next;

finish:
    ret;
