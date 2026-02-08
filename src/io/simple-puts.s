section .data 
  nl db 0xA ; newline 

section .text
  global simplePuts

simplePuts: ; int simplePuts(const char* s) --- put string to stdout
  push rbp
  mov rbp, rsp
  sub rsp, 16

  mov r8, 0 ; string length
  .getLen:
    cmp byte [rdi + r8], 0 ; check if '\0'
    je .print

    inc r8
    jmp .getLen 
  
  .print:
    mov rsi, rdi ; put 'const char* s' to rsi 
    mov rax, 1 ; sys_write
    mov rdi, 1 ; stdout 
    mov rdx, r8 ; num of bytes to read 

    syscall

    lea rsi, [rel nl] ; newline
    mov rax, 1 ; sys_write 
    mov rdi, 1 ; stdout 
    mov rdx, 1 

    syscall

  mov rax, 0 ; success

  mov rsp, rbp 
  pop rbp 
  ret
