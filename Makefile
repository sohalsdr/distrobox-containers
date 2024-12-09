# Some metadata for creating container names
GIT_SHA1 = $(shell git rev-parse --verify HEAD)
IMAGES_TAG = ${shell git describe --exact-match --tags 2> /dev/null || echo 'latest'}
IMAGE_PREFIX = distrobox-containers-

# Unless specified on the command line, build all images (sets IMAGE to a list of every folder in containers/)
IMAGES = $(patsubst containers/%,%,$(wildcard containers/*))

# All targets are `.PHONY` ie allways need to be rebuilt
.PHONY: default container

# Build container image(s) by default
default: container

# Build and tag container image
container:
	$(eval IMAGE_NAME := ${IMAGES})
	$(eval IMAGE_DIR := $(patsubst %,containers/%,${IMAGES}))

	mkdir -p ${IMAGE_DIR}/configs
	cp -r configs/* ${IMAGE_DIR}/configs
	mkdir -p ${IMAGE_DIR}/post-install
	cp -r post-install/* ${IMAGE_DIR}/post-install
	mkdir -p ${IMAGE_DIR}/scripts
	cp -r scripts/* ${IMAGE_DIR}/scripts

	docker build -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG} -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest --build-arg TAG=${IMAGE_PREFIX}${IMAGE_NAME} --build-arg GIT_SHA1=${GIT_SHA1} ${IMAGE_DIR}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest
	
	rm -r ${IMAGE_DIR}/configs ${IMAGE_DIR}/post-install ${IMAGE_DIR}/scripts

