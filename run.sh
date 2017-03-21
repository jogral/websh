#!/bin/bash

CWD=`pwd`
VIRTUALENV=`which virtualenv`
VIRTUALENV_DIR="$CWD/pyenv"
SOCKET_DIR="$CWD/socket"
PYTHON_BIN="$VIRTUALENV_DIR/bin"
PYTHON_EXEC="$PYTHON_BIN/python"
PIP_EXEC="$PYTHON_BIN/pip"

if [ -z $VIRTUALENV ]; then
    echo "You must have python virtualenv to run this."
    exit 1
else
    if [ ! -d $SOCKET_DIR ] || [ ! -f $SOCKET_DIR/server.py ]; then
        echo "The socket file/directory is missing!"
        exit 1
    else
        if [ ! -d $VIRTUALENV_DIR ]; then
            $VIRTUALENV $VIRTUALENV_DIR
            $PIP_EXEC install -r $CWD/requirements.txt
        fi

        echo "Starting server..."
        $PYTHON_EXEC $SOCKET_DIR/server.py
        echo "Quitting..."
        exit 0
    fi
fi
