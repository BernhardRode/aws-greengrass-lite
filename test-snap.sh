#!/bin/bash

set -e

echo "Building snap test container..."
podman build -f Dockerfile.snap -t aws-greengrass-lite-snap-test .

echo "Running snap build and test..."
podman run --rm --privileged aws-greengrass-lite-snap-test

echo "Snap build and test completed!"
