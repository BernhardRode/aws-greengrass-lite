.PHONY: snap snap-clean snap-install snap-test docker-snap clean

VERSION := $(shell cat version)
ARCH := $(shell dpkg --print-architecture 2>/dev/null || echo amd64)
SNAP_FILE := aws-greengrass-lite_$(VERSION)_$(ARCH).snap

# Build snap package
snap:
	@echo "Building snap package..."
	./build-snap.sh

# Clean snap build artifacts
snap-clean:
	snapcraft clean
	rm -f *.snap
	rm -rf parts/ prime/ stage/ snap/.snapcraft/

# Install snap locally
snap-install: snap
	sudo snap install --dangerous --devmode $(SNAP_FILE)

# Test snap installation
snap-test: snap-install
	./test-snap.sh

# Build snap in Docker
docker-snap:
	docker build -f Dockerfile.snap -t aws-greengrass-lite-snap .
	docker run --rm -v $(PWD):/output aws-greengrass-lite-snap cp /workspace/$(SNAP_FILE) /output/

# Clean all build artifacts
clean: snap-clean
	rm -rf build/
	rm -rf snap-root/

help:
	@echo "Available targets:"
	@echo "  snap         - Build snap package"
	@echo "  snap-clean   - Clean snap build artifacts"
	@echo "  snap-install - Build and install snap locally"
	@echo "  snap-test    - Build, install and test snap"
	@echo "  docker-snap  - Build snap in Docker container"
	@echo "  clean        - Clean all build artifacts"
