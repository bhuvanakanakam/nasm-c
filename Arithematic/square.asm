; calculates the a^2-b^2 

global sq_diff         ; 

section .text          ; 

sq_diff:               ; Defines the label for the sq_diff function
  mov rax, rdi         ; Moves the value in rdi to rax (copying the first input parameter)
  mov rbx, rsi         ; Moves the value in rsi to rbx (copying the second input parameter)

  xor rcx, rcx         ; Clears the value in rcx (initialize to zero)
  xor rdx, rdx         ; Clears the value in rdx (initialize to zero)

  mov rcx, 1           ; Sets rcx to 1 (initialize the counter for the loop)
  mov rdx, 1           ; Sets rdx to 1 (initialize the counter for the loop)

next:                  ; Label for the loop
  add rax, rdi         ; Adds the value in rdi to rax (incrementing rax by the value of rdi)
  inc rcx              ; Increments the value in rcx (incrementing the loop counter)
  cmp rcx, rdi         ; Compares rcx and rdi
  jne next             ; Jumps to the 'next' label if rcx is not equal to rdi

next2:                 ; Label for the second loop
   add rbx, rsi        ; Adds the value in rsi to rbx (incrementing rbx by the value of rsi)
   inc rdx             ; Increments the value in rdx (incrementing the loop counter)
   cmp rdx, rsi        ; Compares rdx and rsi
   jne next2           ; Jumps to the 'next2' label if rdx is not equal to rsi

trans:                 ; Label for the subtraction operation
   sub rax, rbx        ; Subtracts the value in rbx from rax (calculating the square difference)

finish:                ; Label for the end of the function
   ret                 ; Returns from the function
