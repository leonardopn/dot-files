# Instruções globais

## Como trabalhar comigo

- Responda em português (pt-BR). Código, identificadores, comentários, mensagens de commit e
  documentação dentro de repositórios ficam em inglês, salvo se o projeto já usa outro idioma.
- Seja direto. Quando houver mais de um caminho razoável, recomende um e diga o porquê em uma frase,
  em vez de listar todas as opções.
- Siga as convenções que o projeto já usa (estrutura, nomes, libs, gerenciador de pacotes) antes de
  qualquer preferência minha descrita aqui.
- Antes de dizer que algo está pronto, rode o que o projeto oferece para validar (testes, type check,
  lint, build). Se não der para rodar, diga isso explicitamente.
- Não adicione dependências novas sem eu pedir ou sem justificar antes.

## Configuração global do Claude

Minhas configurações globais do Claude Code são versionadas no repositório de dot-files:
`~/Documents/Git/Pessoal/dot-files/claude/`.

Os itens dentro de `~/.claude/` são links simbólicos para essa pasta. Nunca crie configuração global
direto em `~/.claude/`: crie no repositório e rode o script de link.

### Onde cada coisa vai

| O que                                | Caminho no repo                        |
| ------------------------------------ | -------------------------------------- |
| Instruções globais (este arquivo)    | `claude/CLAUDE.md`                     |
| Rules globais (um `.md` por regra)   | `claude/rules/<nome>.md`               |
| Skills globais                       | `claude/skills/<nome>/SKILL.md`        |
| Subagentes                           | `claude/agents/<nome>.md`              |
| Slash commands                       | `claude/commands/<nome>.md`            |
| Scripts de hooks                     | `claude/hooks/<nome>.sh`               |
| Status line                          | `claude/statusline.sh`                 |
| Settings (permissões, hooks, tema)   | `claude/settings.json`                 |

- Rules usam o formato de `.claude/rules/`: um tópico por arquivo; frontmatter `paths:` opcional para
  limitar a regra a certos arquivos.
- Hooks e status line são referenciados no `settings.json` como `$HOME/.claude/...`, nunca com o
  caminho absoluto do repo.
- Nada de segredos aqui (tokens, chaves, `.credentials.json`, `~/.claude.json`): o repositório é público.

### Depois de adicionar ou remover algo

```bash
~/Documents/Git/Pessoal/dot-files/scripts/link-claude.sh
```

Necessário principalmente para skills novas, que são linkadas uma a uma em `~/.claude/skills/`
(essa pasta também guarda skills sincronizadas pela organização, em `skills/synced/`).
