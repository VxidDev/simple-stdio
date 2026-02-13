section .text 
  global simpleFgets

simpleFgets: ; rax = char* | rdi = char* , rsi = int n (bytes to read) , rdx = const int stream
  push rbp
  mov rbp, rsp 
  sub rsp, 16

  test rsi, rsi 
  jz .err
  
  mov r8, rdi ; save rdi 

  mov rax, 0 ; sys_read
  mov rdi, rdx ; stream to read from 
  mov rdx, rsi ; amount of bytes to read 
  mov rsi, r8 ; where to store bytes
  
  syscall

  cmp rax, 0
  jl .err
  
  mov byte [rsi + rax], 0 ; null-terminate
  mov rax, rsi ; load char* argument.
  jmp .exit

  .err:
    xor rax, rax ; return NULL

  .exit:
    mov rsp, rbp 
    pop rbp
    ret
