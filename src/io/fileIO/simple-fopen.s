 section .text 
  global simpleFopen

  O_RDONLY equ 0x0 
  O_WRONLY equ 0x1
  O_RDWR equ 0x2
  O_CREAT equ 0x40
  O_APPEND equ 0x400
  O_TRUNC equ 0x200
  MODE_A equ O_WRONLY | O_CREAT | O_APPEND    ; 0x841

simpleFopen: ; rax = int(file descriptor) | rdi = const char* filename , rsi = const char flag
  push rbp
  mov rbp, rsp 
  sub rsp, 16
  
  cmp sil, 'r' ; check if O_RDONLY
  je .setR  

  cmp sil, 'w' ; check if O_WRONLY
  je .setW 

  cmp sil, 'a' ; check if O_APPEND 
  je .setA 

  jmp .invFlag
  
  .setR:
    mov rsi, O_RDONLY
    jmp .syscall 

  .setW:
    mov rsi, O_WRONLY | O_CREAT | O_TRUNC
    mov rdx, 0644o
    jmp .syscall

  .setA:
    mov rsi, MODE_A
    jmp .syscall 

  .syscall: 
    mov rax, 2 ; open syscall
    ; rdi is already set
    ; rsi is also already set
    syscall

    jmp .exit

  ; no need to update rax because its already set from syscall
  
  .invFlag:
      mov rax, -1 
    
  .exit:
    mov rsp, rbp 
    pop rbp
    ret 

