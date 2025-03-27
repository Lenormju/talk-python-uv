#!/bin/bash

rm -rf .venv .python-version pyproject.toml README.md uv.lock __pycache__/ main.py

. ../demo-magic.sh  # https://github.com/paxtonhare/demo-magic

clear
pei '# uv init'
pe 'uv init'
pe 'ls -la'
pei '# check out : pyproject.toml, main.py, .python-version, README.md'
repl

clear
pei '# uv add requests'
pe 'time uv add requests'
pe '# check out : pyproject.toml, uv.lock'  # wait before displaying
repl

clear
pei '# uv run'
pe 'uv run python -m main'
pei '# add dependency to main.py'
pei 'cp ../example_main.py main.py'
pei 'cat main.py'
pe 'uv run python -m main'
pei 'ls -la'
pei 'ls -l .venv/'
pei 'ls -l .venv/lib/python3.13/site-packages'
pe '# try it out !'
repl

clear
pei '# uv sync'
pe 'uv sync'
pe 'rm -rf .venv/'
pe 'uv sync'
pe '# try it out !'
repl

clear
pei '# uv lock'
pe 'uv lock'
pe 'rm -rf .venv/ uv.lock'
pe 'uv lock'
pe '# try it out !'
repl

echo '=== END OF DEMO ==='
