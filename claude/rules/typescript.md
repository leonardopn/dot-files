---
paths:
  - "**/*.{ts,tsx,js,jsx,mjs,cjs,vue,svelte}"
---

# TypeScript / JavaScript

- Use o gerenciador de pacotes indicado pelo lockfile do projeto (`pnpm-lock.yaml`, `yarn.lock`,
  `bun.lock`, `package-lock.json`). Nunca misture gerenciadores.
- Prefira `unknown` a `any`; quando `any` for inevitável, deixe um comentário curto do motivo.
- Não use `@ts-ignore`; se precisar, `@ts-expect-error` com o motivo.
- Depois de mudar código TypeScript, rode o type check do projeto (script `typecheck`/`lint`, ou
  `tsc --noEmit`) e corrija os erros que você introduziu.
