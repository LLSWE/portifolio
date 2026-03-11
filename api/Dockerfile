FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y nasm binutils

WORKDIR /app
COPY main.asm .
COPY index.html .

RUN nasm -f elf64 main.asm -o main.o
RUN ld main.o -o main

FROM scratch

COPY --from=builder /app/main .
COPY --from=builder /app/index.html .

EXPOSE 8080
CMD ["./server"]
