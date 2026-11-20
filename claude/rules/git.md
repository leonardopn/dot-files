# Git

- Mensagens de commit seguem Conventional Commits com gitmoji, em inglês, assunto com inicial
  maiúscula e no imperativo: `<type>(<scope opcional>): <gitmoji> <Subject>`.
    - `feat: :sparkles: Add SSH agent socket configuration`
    - `fix: :bug: Correct update-grub alias path`
    - `refactor: :recycle: Extract S3 upload helpers`
    - Outros: `docs: :memo:`, `chore: :wrench:`, `test: :white_check_mark:`, `perf: :zap:`,
      `style: :lipstick:`, `build: :package:`, `ci: :construction_worker:`.
- Se o repositório já usa outro padrão (veja `git log`), siga o do repositório.
- Um commit por mudança lógica. Não misture refatoração com mudança de comportamento.
- Nunca use `--no-verify`, `--force` ou reescreva histórico já publicado sem eu pedir.
- Nunca commit nada por mim, mesmo que seja trivial, sem eu pedir. Eu sempre gosto de conferir o que vai para o repositório e ai sim eu peço pra você commitar.
- Não insira no final do commit o co-author, mesmo que seja você que fez a mudança.
