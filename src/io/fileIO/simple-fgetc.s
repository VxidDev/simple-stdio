section .bss 
  tmp resb 1

section .text 
  global simpleFgetc

simpleFgetc: ; rax = char | rdi = const int stream
  push rbp 
  mov rbp, rsp
  sub rsp, 16

  mov rax, 0 ; sys_read
  ; rdi is already set
  lea rsi, [rel tmp] 
  mov rdx, 1 ; bytes to read 
  
  syscall
  
  cmp rax, 1
  jne .err

  movzx rax, byte [rel tmp]
  jmp .end 

  .err:
    mov rax, -1
  
  .end:
    mov rsp, rbp
    pop rbp 
    ret 
