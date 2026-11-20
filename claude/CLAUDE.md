# Configuração global do Claude

Minhas configurações globais do Claude Code são versionadas no repositório de dot-files:
`~/Documents/Git/Pessoal/dot-files/claude/`.

Os itens dentro de `~/.claude/` são links simbólicos para essa pasta. Nunca crie configuração global
direto em `~/.claude/`: crie no repositório e rode o script de link.

## Onde cada coisa vai

| O que                                | Caminho no repo                        |
| ------------------------------------ | -------------------------------------- |
| Instruções globais (este arquivo)    | `claude/CLAUDE.md`                     |
| Rules globais (um `.md` por regra)   | `claude/rules/<nome>.md`               |
| Skills globais                       | `claude/skills/<nome>/SKILL.md`        |
| Subagentes                           | `claude/agents/<nome>.md`              |
| Slash commands                       | `claude/commands/<nome>.md`            |
| Settings (permissões, hooks, tema)   | `claude/settings.json`                 |

- Rules usam o formato de `.claude/rules/`: um tópico por arquivo; frontmatter `paths:` opcional para
  limitar a regra a certos arquivos.
- Nada de segredos aqui (tokens, chaves, `.credentials.json`, `~/.claude.json`): o repositório é público.

## Depois de adicionar ou remover algo

```bash
~/Documents/Git/Pessoal/dot-files/scripts/link-claude.sh
```

Necessário principalmente para skills novas, que são linkadas uma a uma em `~/.claude/skills/`
(essa pasta também guarda skills sincronizadas pela organização, em `skills/synced/`).
