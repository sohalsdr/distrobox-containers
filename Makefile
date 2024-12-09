# Some metadata for creating container names
GIT_SHA1 = $(shell git rev-parse --verify HEAD)
IMAGES_TAG = ${shell git describe --exact-match --tags 2> /dev/null || echo 'latest'}
IMAGE_PREFIX = distrobox-containers-

# Unless specified on the command line, build all images (sets IMAGE to a list of every folder in containers/)
IMAGE_DIR = $(wildcard containers/*)

# All targets are `.PHONY` ie allways need to be rebuilt
.PHONY: ${IMAGE}

# Build all images
all: ${IMAGE_DIR}

# Build and tag a single image
${IMAGE_DIR}:
	$(eval IMAGE_NAME := $(subst containers/,,$@))

	mkdir -p $@/configs
	cp -r configs/* $@/configs
	mkdir -p $@/post-install
	cp -r post-install/* $@/post-install
	mkdir -p $@/scripts
	cp -r scripts/* $@/scripts

	docker build -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG} -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest --build-arg TAG=${IMAGE_PREFIX}${IMAGE_NAME} --build-arg GIT_SHA1=${GIT_SHA1} $@
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest
	
	rm -r $@/configs $@/post-install $@/scripts

