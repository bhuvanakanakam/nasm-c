global addMat

section .text
addMat:
    cmp rdx, 0 ; if the size of the matrix is 0x0, return
    je finish
    mov r8, rdx ; store n in r8
    mov r9, rdi ; have A* pointer in r9 (because we'll be modifying rdi)
    mov r10, rsi ; B* pointer in r10
    mov r11, rcx ; C matrix for result in r11

    outerloop_start:
        mov r12, 0 ; i
    outerloop:
        call innerloop_start
        inc r12 ; i++
        cmp r12, r8
        jl outerloop
    finish:
        ret

    innerloop_start:
        mov r13, 0 ; j=0
    innerloop:
        ; c[i*n+j] = a[i*n+j] + b[i*n+j]
        mov rax, r12
        imul r8 ; n*i
        add rax, r13 ; rax holds n*i+j
        mov rcx, 8
        imul rcx ; number to add to the address
        mov rbx, r11
        add rbx, rax ; C[i*n+j]
        
        mov rax, r12
        imul r8 ; n*i
        add rax, r13 ; rax holds n*i+j
        mov rcx, 8
        imul rcx ; number to add to the address
        mov rsi, r9
        add rsi, rax ; A[i*n+j]

        mov rax, r12
        imul r8 ; n*i
        add rax, r13 ; rax holds n*i+j
        mov rcx, 8
        imul rcx ; number to add to the address
        mov rdx, r10
        add rdx, rax ; B[i*n+j]

        mov rax, [rsi]
        add rax, [rdx]
        mov [rbx], rax ; C[i*n+j] = A[i*n+j] + B[i*n+j]

        inc r13
        cmp r13, r8
        jl innerloop
        ret
