section .text
  global simpleFseek

simpleFseek: ; rax = success code | rdi = const int stream , rsi = const long int offset , rdx = const int whence
  push rbp 
  mov rbp, rsp 
  sub rsp, 16

  mov rax, 8 ; sys_lseek
  ; rdi is already set 
  ; rsi is also set 
  ; rdx is also set 
  syscall

  cmp rax, 0
  jge .end 
  mov rax, -1

  .end:
    mov rsp, rbp 
    pop rbp
    ret 
