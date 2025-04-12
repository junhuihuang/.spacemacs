#!/bin/sh

# Install importmagic and epc for importmagic functionality.
pip install --upgrade epc --break-system-packages
pip install --upgrade importmagic --break-system-packages
pip install --upgrade 'python-lsp-server[all]' --break-system-packages
pip install --upgrade jedi --break-system-packages
pip install --upgrade flake8 --break-system-packages
pip install --upgrade autoflake --break-system-packages
pip install --upgrade "ptvsd>=4.2" --break-system-packages

pip install --upgrade yapf --break-system-packages

