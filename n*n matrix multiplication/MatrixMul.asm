; Function to multiply matrices A and B and store the result in matrix C
global mulMat          ; Declare the function as global with the name 'mulMat'
section .text          ; Start the text section

mulMat:                ; Label for the mulMat function
    cmp rdx, 0          ; Compare the third parameter (size of matrix) with 0
    je finish           ; If the size is 0x0, jump to the finish label
    mov r8, rdx         ; Store size 'n' in r8
    mov r9, rdi         ; Pointer to matrix A in r9 (because rdi will be modified)
    mov r10, rsi        ; Pointer to matrix B in r10
    mov r11, rcx        ; Pointer to matrix C (result) in r11

outerloop_start:       ; Label for the start of the outer loop
    mov r12, 0          ; Initialize i to 0

outerloop:             ; Label for the outer loop
    call innerloop_start  ; Call the inner loop to perform matrix multiplication
    inc r12             ; Increment i
    cmp r12, r8         ; Compare i with n
    jl outerloop        ; Jump to outerloop if i < n

finish:                ; Label for the end of the function
    ret                 ; Return from the function

innerloop_start:       ; Label for the start of the inner loop
    mov r13, 0          ; Initialize j to 0

innerloop:             ; Label for the inner loop
    ; C[i*n+j] = 0
    mov rax, r12        ; rax = i
    imul r8             ; rax = n*i
    add rax, r13        ; rax = n*i + j
    mov rcx, 8
    imul rcx            ; rcx = number to add to address (8 bytes per element)
    mov rbx, r11        ; rbx = C matrix
    add rbx, rax        ; rbx = C[i*n+j]

    call addvalue_start ; Call a function to perform the addition of values

    inc r13             ; Increment j
    cmp r13, r8         ; Compare j with n
    jl innerloop        ; Jump to innerloop if j < n

    ret                 ; Return from the inner loop

addvalue_start:        ; Label for the start of the function to add values
    mov r14, 0          ; Initialize k to 0

addvalue:              ; Label for the loop to add values
    ; a[i*n+k]
    mov rax, r12        ; rax = i
    imul r8             ; rax = n*i
    add rax, r14        ; rax = n*i + k
    mov rcx, 8
    imul rcx            ; rcx = number to add to address (8 bytes per element)
    add rax, r9         ; rax = a + n*i+k
    mov rsi, [rax]      ; rsi holds a[n*i+k]

    mov rax, r14        ; rax = k
    imul r8             ; rax = k*n
    add rax, r13        ; rax = k*n + j
    mov rcx, 8
    imul rcx            ; rcx = number to add to address (8 bytes per element)
    add rax, r10        ; rax = b + k*n+j
    mov rax, [rax]      ; rax holds b[k*n+j]

    imul rsi            ; a[n*i+k]*b[k*n+j]
    add [rbx], rax      ; C[i*n+j] += a[n*i+k]*b[k*n+j]

    inc r14             ; Increment k
    cmp r14, r8         ; Compare k with n
    jl addvalue         ; Jump to addvalue if k < n

    ret                 ; Return from the function
