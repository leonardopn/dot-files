---
paths:
  - "**/*.rs"
  - "**/Cargo.toml"
---

# Rust

- Depois de mudar código, rode `cargo clippy` (ou `cargo check` se clippy não estiver disponível)
  e corrija os avisos que você introduziu.
- Evite `unwrap()`/`expect()` fora de testes e exemplos; propague erros com `?`.
- Prefira emprestar (`&T`, `&str`) a clonar; se um `clone()` for a saída mais simples, tudo bem,
  mas não use para contornar o borrow checker sem entender o problema.
