section .bss 
  char resb 1

section .text
  global simpleFputc

simpleFputc: ; rax = ascii code of char written to stream | rdi = const char c , rsi = const int stream
  push rbp 
  mov rbp, rsp
  sub rsp, 16
  
  mov r8, rsi 
  mov byte [rel char], dil ; load stream to r8

  mov rax, 1 ; sys_write
  lea rsi, [rel char] ; char to print 
  mov rdi, r8 ; stream 
  mov rdx, 1 ; bytes to write 

  syscall

  mov rsp, rbp 
  pop rbp 
  ret
