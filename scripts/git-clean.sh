#!/bin/bash

# Inicializa o repositório com fetch e prune de branches e tags
echo "Iniciando fetch com prune de branches e tags..."
git fetch --prune --prune-tags origin

# Limpa branches locais e tags locais que não estão presentes na nuvem

# Obter a lista de branches locais
branches_locally=$(git branch -a | grep -v "remotes/" | cut -d' ' -f2-)

# Obter a lista de branches remotos
branches_remotely=$(git branch -a | grep "remotes/" | cut -d' ' -f2- | sed 's/origin\///g')

# Obter a lista de tags locais
tags_locally=$(git tag)

# Obter a lista de tags remotos
tags_remotely=$(git ls-remote --tags origin | cut -d' ' -f2- | sed 's/\^{}//g')

# Apagar branches locais que não estão presentes na nuvem
for branch in $branches_locally; do
    if ! echo "$branches_remotely" | grep -q "$branch"; then
        echo "Vai apagar branch local: $branch"
        git branch -D "$branch"
    fi
done

# Apagar tags locais que não estão presentes na nuvem
for tag in $tags_locally; do
    if ! echo "$tags_remotely" | grep -q "$tag"; then
        echo "Vai apagar tag local: $tag"
        git tag -d "$tag"
    fi
done
