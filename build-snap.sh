#!/bin/bash
set -e

echo "Building AWS Greengrass Lite snap package..."

# Update version in snapcraft.yaml from version file
VERSION=$(cat version)
sed -i "s/version: '.*'/version: '$VERSION'/" snap/snapcraft.yaml

# Build the snap using snapcraft pack
snapcraft pack

echo "Snap package built successfully!"
