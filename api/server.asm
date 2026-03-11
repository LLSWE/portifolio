global _start

section .text 
_start:
        mov rax, 2 ; open html 
        mov rdi, filepath
        mov rsi, 0
        mov rdx, 0
        syscall
        mov r12, rax

        mov rax, 0 ; read 
        mov rdi, r12
        mov rsi, filebuff
        mov rdx, 4096
        syscall
        mov r13, rax 

        mov r13, rax  
        mov rax, 3    ; close 
        mov rdi, r12
        syscall


        mov rax, 41 ; socket 
        mov rdi, 2
        mov rsi, 1
        mov rdx, 0
        syscall
        mov r14, rax

        mov rax, 49 ; bind 
        mov rdi, r14
        mov rsi, socketaddr
        mov rdx, 16
        syscall

        mov rax, 50 ; listen 
        mov rdi, r14
        mov rsi, 5
        syscall

        mov rax, 1 
        mov rdi, 1
        mov rsi, cmsg
        mov rdx, cmsglen
        syscall


.accept_loop:
        mov rax, 43 ; accept
        mov rdi, r14
        mov rsi, 0
        mov rdx, 0 
        syscall
        mov r15, rax

        mov rax, 1 ; write
        mov rdi, r15
        mov rsi, header
        mov rdx, headerlen
        syscall

        mov rax, 1 
        mov rdi, r15
        mov rsi, filebuff
        mov rdx, r13
        syscall

        mov rax, 3 ; exit
        mov rdi, r15
        syscall

        jmp .accept_loop


section .data 
        filepath: db "index.html", 0 
        socketaddr: 
            dw 2 
            dw 0x901F
            db 0, 0, 0, 0 ; prod, local 127.0.0.1
            dq 0 
        header: db "HTTP/1.1 200 OK", 13, 10, "Content-Type: text/html", 13, 10, 13, 10
        headerlen: equ $ - header

        cmsg: db "Server is listening on http://localhost:8080/", 0xa
        cmsglen: equ $ - cmsg 
section .bss 
        filebuff: resb 4096
