---
title: uv, la révolution pour Python
subtitle: 
keywords: python
author: Julien Lenormand
lang: fr
navigationMode: linear
slideNumber: true
---

# Sondage

> * Qui a déjà utilisé uv ?
> * Qui pense que l'outillage en Python c'est le bazar ?

# L'écosystème Python

## Une force

![xkcd : python](xkcd353_python.png)

## Une faiblesse

![xkcd : python environment](xkcd1987_python_environment.png)

## À la recherche des bonnes pratiques

![keynote de Françoise Conil à la PyCon 2024](francoise_conil_recherche_bonnes_pratiques_packaging.png)

## Différents besoins

![Anna-Lena Popkes - unbiased evaluation of [...] tools](venn_diagram_updated_08_2024.png) { style="height: 700;" }

## Le risque de l'Open-Source

![xkcd : dependency](xkcd2347_dependency.png)

## L'hétérogénéité

![xkcd : standards](xkcd927_standards.png)

# Astral

## La productivité, pour Python

![https://astral.sh/about](astral_about.png)

## Ruff, un linter pour les gouverner tous

![https://docs.astral.sh/ruff/](astral_ruff.png) { style="height: 700px;" }

## les bonnes personnes, et l'argent

> * RipGrep
> * Bat
> * Hyperfine
> * Maturin
> * CPython core dev
> * ...
> * "VC money"

# uv

## "Cargo pour python"

![https://docs.astral.sh/uv/](astral_uv.png)

## Repartir sur de bonnes bases

> * `pyproject.toml` (pas de `.py` ni `.cfg` ni `.txt` ...)
> * PEPs : adopter voire contribuer
> * intégrations : Docker, Jupyter, pre-commit, GitHub Actions, Gitlab CI/CD, ...
> * [python-build-standalone](https://github.com/indygreg/python-build-standalone)
> * pas besoin de bootstrap grâce à Rust

## Mise en place

> 1. `requirements.txt`
> 2. `pyproject.toml` (Poetry, ...)
> 3. `uv`

. . .

ou bien : `uv init` + `uv add`

# Success stories

> * "l'essayer c'est l'adopter"
> * vitesse (exécution, résolution des dépendances, réduction des downloads, caching, ...)
> * ergonomie (options, erreurs claires)
> * automatisation de l'environnement virtual (peu de commandes, reproductif et déclaratif)
> * gestion facile et rapide de la version de Python
> * gestion du tooling (`uv tool ...`)
> * lock file (reproductibilité dans le temps ou entre les personnes)
> * bien meilleur que les autres, et s'améliore encore 😅

# { .blank data-background-image="theme/image_page_de_fin_kaizen.jpg" }

::: { .contact }

Julien Lenormand

Dev / DevOps / Craft / Talk

LinkedIn/julien-lenormand

:::

# Questions { .blank data-background-image="simon-hurry-DxC7IwXQkxI-unsplash.jpg" }

> ?

# Bonus : vélocité

![https://github.com/python-poetry/poetry/graphs/commit-activity](commits_per_week_poetry.png)

![https://github.com/pdm-project/pdm/graphs/commit-activity](commits_per_week_pdm.png)

![https://github.com/astral-sh/uv/graphs/code-frequency](commits_per_week_uv.png)

# CFP

Vous faites du Python et vous ne connaissez pas encore UV ? Ce talk est fait pour vous !

Vous ne faites principalement pas du Python mais ça vous arrive d'en croiser ? Ce talk est fait pour vous !

Vous trouvez que Python c'est naze, et vous ne voulez pas y toucher même avec un bâton ? Ce talk est fait pour vous !

En quelques mois, uv a révolutionné la façon d'utiliser Python, tout simplement. Et ça concerne tout le monde : Python est présent partout.

Venez découvrir ce que c'est, pour quoi faire, pourquoi, par qui, comment, vers quoi, vers où.

Promis, je serai ~~im~~partial !
