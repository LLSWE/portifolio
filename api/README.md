# Meu aprendizado sobre assembly 86x64

- Lsp no neovim atrapalha mais doque ajuda, assembly não possui sintaxe fixa e o asm-lsp constantemente mistura ambos NASM e GAS (esse problema pode ser removido com o arquivo de config que as docs do lsp indica mas isso quebra totalmente a imersão de dev anos 80) 

### Específicações

- Para esse projeto escolhi: 
      - Nasm como assembler 
      - elf64 como formatação (nativa Linux)
      - Gnu Linker (ld) como linker
