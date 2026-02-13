section .text 
  global simpleFputs

simpleFputs: ; rax = success code | rdi = const char* str , rsi = const int stream
  push rbp
  mov rbp, rsp 
  sub rsp, 16
  
  mov rcx, 0 ; clear iteration
  .strlen:
    cmp byte [rdi + rcx], 0 ; check if '\0'
    je .write
    
    inc rcx 

    jmp .strlen 

  .write:
    mov r8, rdi ; save const char*
  
    mov rax, 1 ; sys_write
    mov rdi, rsi ; stream to write to
    mov rsi, r8
    mov rdx, rcx 

    syscall 

  mov rsp, rbp 
  pop rbp 
  ret 
