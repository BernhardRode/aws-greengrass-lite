#!/bin/bash
set -e

echo "=== Running local checks ==="

# Check spelling
if command -v cspell &> /dev/null; then
    echo "Checking spelling..."
    cspell "**" --quiet
else
    echo "cspell not found, install with: npm install -g cspell"
fi

# Check EditorConfig
if command -v editorconfig-checker &> /dev/null; then
    echo "Checking EditorConfig..."
    editorconfig-checker
else
    echo "editorconfig-checker not found, install with: npm install -g editorconfig-checker"
fi

# Check formatting (basic YAML check)
if command -v yamllint &> /dev/null; then
    echo "Checking YAML formatting..."
    yamllint .github/workflows/build-snap.yml snap/snapcraft.yaml
else
    echo "yamllint not found, install with: pip install yamllint"
fi

echo "=== All checks completed ==="
