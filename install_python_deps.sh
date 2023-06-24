#!/bin/sh

# Install importmagic and epc for importmagic functionality.
pip install --upgrade epc
pip install --upgrade importmagic
pip install --upgrade 'python-lsp-server[all]'
pip install --upgrade jedi
pip install --upgrade flake8
pip install --upgrade autoflake
pip install --upgrade "ptvsd>=4.2"

pip install --upgrade yapf

