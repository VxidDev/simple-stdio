section .bss
  tmp resb 1

section .text
  global simplePutc

simplePutc: ; rax = char ascii | rdi = const char c
  push rbp
  mov rbp, rsp
  sub rsp, 16
  
  mov [rel tmp], dil ; save ASCII code
 
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  lea rsi, [rel tmp]
  mov rdx, 1 ; bytes to print

  syscall

  mov rax, rdi 

  mov rsp, rbp
  pop rbp 
  ret
  
