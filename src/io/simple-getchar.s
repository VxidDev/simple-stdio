section .bss
  tmp resb 1 ; for '\n'

section .text
  global simpleGetchar

simpleGetchar: ; rax = char | void 
  push rbp
  mov rbp, rsp 
  sub rsp, 16
  
  mov rax, 0 ; sys_read
  mov rdi, 0 ; stdin
  lea rsi, [rel tmp] ; buffer for input 
  mov rdx, 1 ; single char + newline

  syscall
  
  mov al, [rel tmp] 

  mov rsp, rbp 
  pop rbp 
  ret 
