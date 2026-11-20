---
paths:
  - "**/*.{py,ipynb}"
  - "**/pyproject.toml"
  - "**/requirements*.txt"
---

# Python

- Use o ambiente do projeto (`uv`, `poetry` ou `.venv`, conforme os arquivos presentes). Nunca rode
  `pip install` no Python do sistema.
- Código novo leva type hints nas assinaturas públicas.
- Em notebooks, não reexecute células pesadas (treino, download de dataset) sem perguntar. Prefira
  extrair lógica reutilizável para módulos `.py` em vez de crescer o notebook.
- Em código de ML, fixe seeds quando o resultado precisar ser reproduzível e não vaze dados de
  teste para treino ou para o pré-processamento.
