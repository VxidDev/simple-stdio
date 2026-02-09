section .text 
  global simpleFclose

simpleFclose: ; rax = success? | rdi = const int file 
  push rbp
  mov rbp, rsp 
  sub rsp, 16

  ; rdi is already set 
  mov rax, 3 ; sys_close
  syscall

  mov rsp, rbp
  pop rbp
  ret 
