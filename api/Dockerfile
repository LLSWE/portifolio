FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y nasm binutils

WORKDIR /app
COPY server.asm .
COPY index.html .

RUN nasm -f elf64 server.asm -o server.o
RUN ld server.o -o server

# FROM scratch
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/server .
COPY --from=builder /app/index.html .

EXPOSE 8080
CMD ["./server"]
