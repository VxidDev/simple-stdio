section .text 
  global simpleRename

simpleRename: ; rax = success code | rdi = const char *old , rsi = const char *new
  push rbp
  mov rbp, rsp 
  sub rsp, 16

  mov rax, 82 ; sys_rename
  syscall

  mov rsp, rbp 
  pop rbp
  ret
