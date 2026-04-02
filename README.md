# Meu aprendizado sobre assembly 86x64

- Lsp no neovim atrapalha mais doque ajuda, assembly não possui sintaxe fixa e o asm-lsp constantemente mistura ambos NASM e GAS (esse problema pode ser removido com o arquivo de config que as docs do lsp indica mas isso quebra totalmente a imersão de dev anos 80) 
- O Assembly é como todo computador é em sua natureza, literal, restrido estritamente a suas intruções, sem passar por nenhum nível de abstração, toda execução de funcionalidade do sistema deve ser feita por uma chamada do sistema ; *syscall* ; fazendo com que o programa se comunique direto com o kernel para execução das funcionalidades necessárias
### Específicações

- Para esse projeto escolhi: 
      - Nasm como assembler 
      - elf64 como formatação (nativa Linux)
      - Gnu Linker (ld) como linker

### Como Rodar:
Tranformar o arquivo de assembly em object file 
```
```
``
**nasm -f elf64 server.asm -o server.o**
``
Transformar o object file em um output executável 
**ld server.o**

### Documentação para execução do projeto 
- [Tabela para system calls](https://filippo.io/linux-syscall-table/)
- [Registradores](https://math.hws.edu/eck/cs220/f22/registers.html)
- [Documentação Nasm](https://www.nasm.us/docs.html)
- [Linux Man Pages](https://man7.org/linux/man-pages/)
- [Tabela pra conversão em hex](https://www.rapidtables.com/convert/number/decimal-to-hex.html?x=8080)
