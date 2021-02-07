#!/bin/sh

# Install importmagic and epc for importmagic functionality.
pip install --upgrade epc
pip install --upgrade importmagic
pip install --upgrade "jedi>=0.13.0" "json-rpc>=1.8.1" "service_factory>=0.1.5"
## pip install --upgrade python-language-server[all]
# for import sorting
pip install --upgrade pyls-isort
# for mypy checking (python 3.4+ is needed)
pip install --upgrade pyls-mypy
pip install --upgrade pyls-black
# Syntax checking uses flake8 package:
pip install --upgrade flake8
# To be able to suppress unused imports easily, install autoflake
pip install --upgrade autoflake
# To use dap-mode for debugging do
pip install --upgrade "ptvsd>=4.2"

pip install --upgrade yapf

