# Just recipes for beets' plugin development
# Latest change:
# 2025-04-22: First version

[private]
list:
  @just --list


set export
set dotenv-load

# Variables
BEETSDIR := justfile_directory() / "data"

# Run local (plugin) beet
localbeet *args:
  @uv pip install -e .
  @uv run beet {{args}}

alias beet := localbeet

# Publish plugin to pypi
publish:
  @uv build
  @uv publish
