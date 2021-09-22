#!/bin/bash
PY_STR="$(which python)"
if [[ ${PY_STR} == *"/.venvs/sphinx/"* ]]; then
    echo "yes, venv activated"
else
    echo "no, activate venv now"
    source ~/.venvs/sphinx/bin/activate
    echo "venv activated"
fi
sphinx-autobuild --port 9978 --host localhost ~/repo/carcarpro ~/repo/carcarpro/_build_html