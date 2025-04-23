# Just recipes for beets' plugin development
# Latest change:
# 2025-04-22: First version

[private]
list:
  @just --list


set export

# Variables
BEETSDIR := justfile_directory() / "data"

# test
t1 *args:
  @showparams.sh "{{args}}"

# Run local (plugdev) beet (Note: Does not work mright with args containing spaces!)
localbeet *args:
  @uv pip install -e .
  @uv run beet {{args}}

# Run local (plugdev) beet with import
beetimp args:
  @uv pip install -e .
  @uv run beet imp "{{args}}"

# test for the environment
tenv:
  @pwd
  @echo $BEETSDIR