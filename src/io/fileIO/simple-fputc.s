section .bss 
  char resb 1

section .text
  global simpleFputc

simpleFputc: ; rax = ascii code of char written to stream | rdi = const char c , rsi = const int stream
  push rbp 
  mov rbp, rsp
  sub rsp, 16
  
  mov byte [rel char], dil ; Store char c into 'char' variable
  
  mov rax, 1           ; sys_write
  mov rdi, rsi         ; Set rdi (file descriptor) to stream (from original rsi)
  lea rsi, [rel char]  ; Set rsi (buffer) to address of 'char'
  mov rdx, 1           ; Set rdx (count) to 1 

  syscall

  mov rsp, rbp 
  pop rbp 
  ret
