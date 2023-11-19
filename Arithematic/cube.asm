; calculate a^3-b^3 / a-b

global Calc
section .text
Calc:
    mov rax,rdi;
    mov rbx,rsi;
    xor r10,r10; answer
    mov r8,rax;
    mov r9,rbx;

a_square:
    add r8,rdi;
    dec rax;
    cmp rax,$1;
    je a_temp;
    jne a_square;

a_temp:
    mov rax,rdi;
    mov rcx,r8;

a_cube:
    add r8,rcx;
    dec rax;
    cmp rax,$1;
    je b_square;
    jne a_cube;


b_square:
    add r9,rsi;
    dec rbx;
    cmp rbx,$1;
    je b_temp;
    jne b_square;

b_temp:
    mov rbx,rsi;
    mov rcx,r9;

b_cube:
    add r9,rcx;
    dec rbx;
    cmp rbx,$1;
    je a3_b3;
    jne b_cube;

a3_b3:
    sub r8,r9; a3-b3

a_b:
    mov rcx,rdi;
    mov rdx,rsi;
    add rcx,rdx; a+b

Div:
    sub r8,rcx;
    inc r10;
    cmp r8,$0;
    jg Div;
    jle finish;

finish:
    mov rax,r10;
    ret;

    

    

