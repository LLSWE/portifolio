run: api/server.asm
	nasm -f elf64 api/server.asm -o server.o && ld server.o -o server.out && ./server.out

clean: server.out
	rm -rf server.out server.o
