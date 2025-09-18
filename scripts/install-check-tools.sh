#!/bin/bash
set -e

echo "=== Installing local check tools ==="

# Install Node.js tools
if command -v npm &> /dev/null; then
    echo "Installing cspell and editorconfig-checker..."
    npm install -g cspell editorconfig-checker
else
    echo "npm not found. Please install Node.js first."
fi

# Install Python tools
if command -v pip &> /dev/null; then
    echo "Installing yamllint..."
    pip install yamllint
else
    echo "pip not found. Please install Python first."
fi

echo "=== Installation completed ==="
echo "Run ./scripts/check-local.sh to check your files"
