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

	mkdir -p $@/configs
	cp -r configs/* $@/configs
	mkdir -p $@/post-install
	cp -r post-install/* $@/post-install
	mkdir -p $@/scripts
	cp -r scripts/* $@/scripts

	docker build -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG} -t ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest --build-arg TAG=${IMAGE_PREFIX}${IMAGE_NAME} --build-arg GIT_SHA1=${GIT_SHA1} ${IMAGE_DIR}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:${IMAGES_TAG}
	docker push ghcr.io/${GHCR_OWNER}/${IMAGE_PREFIX}${IMAGE_NAME}:latest
	
	rm -r $@/configs $@/post-install $@/scripts

