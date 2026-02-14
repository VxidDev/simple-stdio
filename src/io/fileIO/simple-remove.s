section .text
  global simpleRemove

simpleRemove: ; rax = success code | rdi = const char* filename
  push rbp
  mov rbp, rsp 
  sub rsp, 16

  mov rax, 87 ; sys_unlink
  ; rdi is already set 
  syscall

  mov rsp, rbp 
  pop rbp 
  ret 
