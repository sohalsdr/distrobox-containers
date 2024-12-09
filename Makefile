# Some metadata for creating container names
GIT_SHA1 = $(shell git rev-parse --verify HEAD)
IMAGES_TAG = ${shell git describe --exact-match --tags 2> /dev/null || echo 'latest'}
IMAGE_PREFIX = distrobox-containers-

# Unless specified on the command line, build all images (sets IMAGE to a list of every folder in containers/)
IMAGES = $(subst containers/,,$(wildcard containers/*))

# All targets are `.PHONY` ie allways need to be rebuilt
.PHONY: all ${IMAGES}

# Build all images (or only specified image(s) if IMAGE_DIR is overriden)
all: ${IMAGES}

# Build and tag a single image
${IMAGES}:
	$(eval IMAGE_NAME := $@)
	$(eval IMAGE_DIR := $(patsubst %,containers/%,$@))

	mkdir -p ${IMAGE_DIR)/configs
	cp -r configs/* ${IMAGE_DIR)/configs
	mkdir -p ${IMAGE_DIR)/post-install
	cp -r post-install/* ${IMAGE_DIR)/post-install
	mkdir -p ${IMAGE_DIR)/scripts
	cp -r scripts/* ${IMAGE_DIR)/scripts

	docker build -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG} -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest --build-arg TAG=${IMAGE_PREFIX}${IMAGE_NAME} --build-arg GIT_SHA1=${GIT_SHA1} ${IMAGE_DIR}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest
	
	rm -r ${IMAGE_DIR)/configs ${IMAGE_DIR)/post-install ${IMAGE_DIR)/scripts

