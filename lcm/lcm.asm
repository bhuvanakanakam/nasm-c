global Lcm                      
section .text

Lcm:                            
    mov r11, [rdi];             ; Move the first element from the array to r11
    cmp rsi, $1;                ; Compare rsi with 1
    je finish;                  ; If equal, jump to finish

Lcm_1:                          
    dec rsi;                    ; Decrement rsi
    cmp rsi, $0;                ; Check if rsi is 0
    jz finish;                  ; If equal, jump to finish
    add rdi, $8;                ; Move to the next element in the array
    mov r12, [rdi];             ; Move the next element from the array to r12

Gcd_2:                          
    mov r8, r11;                ; Copy r11 to r8 (a or previous LCM)
    mov r9, r12;                ; Copy r12 to r9 (b)

    cmp r8, r9;                 ; Compare a and b
    jl minA;                    ; If a < b, jump to minA
    jge minB;                   ; If a >= b, jump to minB

minB:                           
    mov r10, r9;                ; Copy r9 to r10 (r10 is the minimum element)
    jmp loop_for_a;             ; Jump to loop_for_a

minA:                           
    mov r10, r8;                ; Copy r8 to r10 (r10 is the minimum element)
    jmp loop_for_a;             ; Jump to loop_for_a

loop_for_a:                     
    cmp r10, $0;                ; Check if r10 is 0
    jz finish_loop;             ; If equal, jump to finish_loop

    mov rax, r8;                ; Copy r8 to rax
    mov rbx, r10;               ; Copy r10 to rbx
    mov rdx, $0;                ; Clear rdx (remainder)
    idiv rbx;                   ; Divide rax by rbx, result in rax, remainder in rdx

    cmp rdx, $0;                ; Check if remainder is 0
    jz loop_for_b;              ; If equal, jump to loop_for_b
    jnz loop_not_done;          ; If not equal, jump to loop_not_done

loop_for_b:                     
    mov rax, r9;                ; Copy r9 to rax
    mov rbx, r10;               ; Copy r10 to rbx
    mov rdx, $0;                ; Clear rdx (remainder)
    idiv rbx;                   ; Divide rax by rbx, result in rax, remainder in rdx

    cmp rdx, $0;                ; Check if remainder is 0
    jz finish_loop;             ; If equal, jump to finish_loop
    jnz loop_not_done;          ; If not equal, jump to loop_not_done

loop_not_done:                  
    sub r10, $1;                ; Decrement r10
    jmp loop_for_a;             ; Jump back to loop_for_a

finish_loop:                    
    mov r11, r10;               ; Copy r10 to r11 (r11 now contains the GCD)
    jmp Lcm_cal;                ; Jump to Lcm_cal for further calculation

Lcm_cal:                        
    mov rax, r8;                ; Copy r8 to rax (a or previous GCD)
    mov rbx, r9;                ; Copy r9 to rbx (b)
    mov rdx, $0;                ; Clear rdx
    imul rbx;                   ; Multiply a and b, result in rax

    mov rax, rax;               ; Copy the result to rax
    mov rbx, r11;               ; Copy the GCD to rbx
    div rbx;                    ; Divide the result by the GCD, result in rax

    mov r11, rax;               ; Copy the final result to r11
    jmp Lcm_1;                  ; Jump back to Lcm_1 for the next iteration

finish:                         
    mov rax, r11;               ; Move the result to rax
    ret                          ; Return from the function
