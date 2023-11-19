; Function to calculate a^2 - b^2

global sq_diff         ; Declare the function as global with the name 'sq_diff'
section .text          ; Start the text section

sq_diff:               ; Label for the sq_diff function
  mov rax, rdi         ; Move the value in rdi to rax (copying the first input parameter)
  mov rbx, rsi         ; Move the value in rsi to rbx (copying the second input parameter)

  xor rcx, rcx         ; Clear the value in rcx (initialize to zero)
  xor rdx, rdx         ; Clear the value in rdx (initialize to zero)

  mov rcx, 1           ; Set rcx to 1 (initialize the counter for the first loop)
  mov rdx, 1           ; Set rdx to 1 (initialize the counter for the second loop)

next:                  ; Label for the first loop
  add rax, rdi         ; Add the value in rdi to rax (incrementing rax by the value of rdi)
  inc rcx              ; Increment the value in rcx (incrementing the loop counter)
  cmp rcx, rdi         ; Compare rcx and rdi
  jne next             ; Jump to the 'next' label if rcx is not equal to rdi

next2:                 ; Label for the second loop
   add rbx, rsi        ; Add the value in rsi to rbx (incrementing rbx by the value of rsi)
   inc rdx             ; Increment the value in rdx (incrementing the loop counter)
   cmp rdx, rsi        ; Compare rdx and rsi
   jne next2           ; Jump to the 'next2' label if rdx is not equal to rsi

trans:                 ; Label for the subtraction operation
   sub rax, rbx        ; Subtract the value in rbx from rax (calculating the square difference)

finish:                ; Label for the end of the function
   ret                 ; Return from the function
