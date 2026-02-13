section .text
  global simpleFtell

simpleFtell: ; rax = current position | rdi = const int stream
  push rbp
  mov rbp, rsp
  sub rsp, 16

  mov rax, 8 ; sys_lseek
  ; rdi is already set 
  mov rsi, 0 ; offset (0 to get current position)
  mov rdx, 1 ; whence (1 = SEEK_CUR)
  
  syscall

  mov rsp, rbp 
  pop rbp
  ret 
