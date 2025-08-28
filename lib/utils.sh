#!/bin/bash

# Shared utility functions

# Function to load environment variables from .envrc
load_env() {
    if [ -f .envrc ]; then
        set -a
        source .envrc
        set +a
    else
        echo "Error: .envrc file not found."
        exit 1
    fi
}
