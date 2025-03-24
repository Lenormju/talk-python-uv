---
title: "uv : la révolution pour Python"
---

# Préambule

répétition pour Jeudi : Meetup Python

super cool, venez

notes vos remarques constructives, ce qui n'est pas clair, ce qui mérite illustration, ...

redites par rapport à Décembre au début, mais version + clean et + complète

---

# Ecosystème Python fracturé et fragile (et lent)

![xkcd : standards](xkcd927_standards.png)

![xkcd : python environment](xkcd1987_python_environment.png)

---

![Anna-Lena Popkes - unbiased evaluation of [...] tools](venn_diagram_updated_08_2024.png)

---

## A la recherche des bonnes pratiques

TODO replay Francoise Conil
TODO lien de ses slides

confondre le problème et la solutions
détails d'implémentation

---

# Astral

objectif : productivité en Python (cf Cargo)

![https://astral.sh/about](astral_about.png)

---

## Ruff

![https://docs.astral.sh/ruff/](astral_ruff.png)

---

## La recette du succès

* des gens compétents (expérience, connus de la communauté ...)
* salariés
* nombreux (12+)
* n'ont "rien" inventé

---

## Risques

* VC
* Rust
* [licencing](https://docs.astral.sh/uv/reference/policies/license/) (dual MIT + Apache2)
* ![xkcd : dependency](xkcd2347_dependency.png)

---

Poetry ![https://github.com/python-poetry/poetry/graphs/commit-activity](commits_per_week_poetry.png)

PDM ![https://github.com/pdm-project/pdm/graphs/commit-activity](commits_per_week_pdm.png)

Pip ![https://github.com/pypa/pip/graphs/commit-activity](commits_per_week_pip.png)

Pipenv ![https://github.com/pypa/pipenv/graphs/commit-activity](commits_per_week_pipenv.png)

uv ![https://github.com/astral-sh/uv/graphs/commit-activity](commits_per_week_uv.png)

---

# uv

tout part de rye

puis pip

et enfin uv

---

![https://docs.astral.sh/uv/](astral_uv.png)

---

## Repartir sur de bonnes bases

> * `pyproject.toml` (pas de `.py` ni `.cfg` ni `.txt` ...)
> * PEPs : adopter voire contribuer
> * intégrations : Docker, Jupyter, pre-commit, GitHub Actions, Gitlab CI/CD, ...
> * [python-build-standalone](https://github.com/indygreg/python-build-standalone)
> * pas besoin de bootstrap grâce à Rust
> * *second-mover advantage* / *standing on the shoulders of giants*
> * commandes de haut niveau, orientées résultat

---

## Performance

* Rust
* network optimisation
* caching
* ...
* cf seconde moitié du talk chez Jane Street : https://www.youtube.com/watch?v=gSKTfG1GXYQ

---

## Success stories

* "l'essayer c'est l'adopter"
* vitesse (exécution, résolution des dépendances, réduction des downloads, caching, ...)
* ergonomie (options, erreurs claires)
* automatisation de l'environnement virtuel (peu de commandes, reproductif et déclaratif)
* gestion facile et rapide de la version de Python
* gestion du tooling (`uv tool ...`)
* lock file (reproductibilité dans le temps ou entre les personnes)
* bien meilleur que les autres, et s'améliore encore 😅
* `git clone` puis `uv run` et ça marche !

---

Même BiteCode !

[Relieving your Python packaging pain](https://www.bitecode.dev/p/relieving-your-python-packaging-pain)

Avant :

> 1. Don’t install the latest major version of Python
> 2. Use only the python.org installer on Windows and Mac, or official repositories on Linux.
> 3. Never install or run anything outside of a virtual environment
> 4. Limit yourself to the basics: “pip” and “venv”
> 5. If you run a command, use “-m”
> 6. When creating a virtual environment, be explicit about which Python you use

---

Après :

![UPDATE](bitecode_update_use_uv.png)

[A year of uv: pros, cons, and should you migrate](https://www.bitecode.dev/p/a-year-of-uv-pros-cons-and-should)

---

# Migration

* [installation](https://docs.astral.sh/uv/getting-started/installation/) : curl, PyPI, Cargo, Homebrew, WinGet, Docker, ...
* `pyproject.toml` :
  * https://github.com/stvnksslr/uv-migrator
  * https://github.com/mkniewallner/migrate-to-uv

---

Avant (Pip `requirements.txt`) :
```
toto ~= 1.2.3
--extra-index-url https://example.com/simple
titi == 4.5.6
```

Situation :
* la convention est que les indexes doivent avoir un contenu identique
* or, j'ai des sources hétérogènes (PyPI public, registries internes, ...)

Problème :
* les install échouent souvent car Pip cherche sur le "mauvais" index

Solution :
* ???
* avoir des fichiers séparés, les installés séparément, prier pour qu'il n'y ait pas de conflits

---

Avant (Poetry `pyproject.toml`) :
```toml
[tool.poetry.dependencies]
python = "~3.12"
toto = {version = "^1.2.3", source = "pypi"}
titi = {version = "4.5.6", source = "artifactory"}

[[tool.poetry.source]]
name = "pypi"
# url is omitted for PyPI
priority = "primary"

[[tool.poetry.source]]
name = "artifactory"
url = "https://example.com/simple"
priority = "explicit"
```

+ credentials dans `~/.config/pypoetry/auth.toml` ou [`keyring`](https://pypi.org/project/keyring/)

---

Après (uv `pyproject.toml`):
```toml
[project]
dependencies = [
    "toto ~= 1.2.3",
    "titi == 4.5.6",
]

[tool.uv.sources]
titi = { index = "artifactory" }

[[tool.uv.index]]
name = "artifactory"
url = "https://example.com/simple/"
```

+ variables d'environnement `UV_INDEX_ARTIFACTORY_USERNAME=...` + `UV_INDEX_ARTIFACTORY_PASSWORD=...` ou bien `--keyring-provider subprocess`

---

## Integrations : CI

```yaml
linting:
  image: ghcr.io/astral-sh/uv:debian-slim
  script:
    - uv run ruff check .
    - uv run mypy .
```

* [Using uv in GitLab CI/CD](https://docs.astral.sh/uv/guides/integration/gitlab/)
* [Using uv in GitHub Actions](https://docs.astral.sh/uv/guides/integration/github/)

---

## Intégration : private registry

* [Using alternative package indexes](https://docs.astral.sh/uv/guides/integration/alternative-indexes/) :
  * Azure Artifacts
  * Google Artifact Registry
  * AWS CodeArtifact
  * JFrog's Artifactory
  * GitLab registry

---

## Commandes

---

## uv pip

"low-level plumbing" (comme pour git)

---

## uv venv

presque un détail d'implémentation

une contrainte de l'environnement (et de la conception) de Python

---

## uv run

shell shebang trick (Linux only) :

`#!/usr/bin/env -S uv run --script`

`/usr/bin/env '-S uv run --script' foo.py`

---

## uv tool run

`uvx` pour les intimes

marche pour tout package Python qui déclare des *entrypoints* :

`uv tool run ruff check .`

et on peut mettre ce qu'on veut avec des `with` :

`uv tool run --with requests python -c 'import requests; print(requests)'`

---

## Next steps

* uv :
  * 
* RedKnot : type checker par Astral
* Pixi : project manager pas limité à Python (cf Conda)

---

# Sources

* https://www.saaspegasus.com/guides/uv-deep-dive/ (pas si deep)
* https://www.youtube.com/watch?v=byynvdS_7ac

---

# Fin : questions ?
