ection .text
global mulMat

mulMat:
    vmovdqu xmm14,rdx;vmovdqu vpaddqress of c into r14
    vmovdqu xmm15,rcx;size of n
    vmovdqu xxm8,0;i

i_loop:
    vmovdqu xmm9,0;j
    cmp xmm8,xmm15;
    je finish;
    jne j_loop;

i_inc:
    inc xmm8;
    jmp i_loop;

j_loop:
    vmovdqu xmm10,0;k
    cmp xmm9,xmm15;
    je i_inc;
    jne k_loop;

j_inc:
    inc xmm9;
    jmp j_loop;

k_loop:
    cmp xmm10,xmm15;
    je j_inc;
    jne multiply;

multiply:

    ;i*n+j
    vmovdqu xmm0,xmm8;
    vmovdqu xmm1,xmm15;
    vmovdqu xmm3,$0;
    vpmuldq xmm1;
    vpaddq xmm0,xmm9; i*n+j
    vmovdqu xmm1,$8;
    vpmuldq xmm1;
    vmovdqu xmm11,xmm0;(i*n+j)*8
    vpaddq xmm11,xmm14;

    ;i*n+k
    vmovdqu xmm0,xmm8;
    vmovdqu xmm1,xmm15;
    vmovdqu xmm3,$0;
    vpmuldq xmm1;
    vpaddq xmm0,xmm10;i*n+k
    vmovdqu xmm1,$8;
    vpmuldq xmm1;
    vmovdqu xmm12,xmm0; i*n+k*8
    vpaddq xmm12,rdi;

    ;k*n+j
    vmovdqu xmm0,xmm10;
    vmovdqu xmm1,xmm15;
    vmovdqu xmm3,$0;
    vpmuldq xmm1;
    vpaddq xmm0,xmm9;k*n+j
    vmovdqu xmm1,$8;
    vpmuldq xmm1;
    vmovdqu xmm13,xmm0; (k*n+j)*8
    vpaddq xmm13,rsi;


    vmovdqu xmm0,[xmm12];
    vmovdqu xmm1,[xmm13];
    vpmuldq xmm1;
    vpaddq [xmm11],xmm0; 


    inc xmm10;
    jmp k_loop;


finish:
    ret;
