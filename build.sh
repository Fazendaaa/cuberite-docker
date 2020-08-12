#!/usr/bin/sh
docker buildx build --build-arg NPROC=`nproc` --platform linux/amd64 --push --tag fazenda/cuberite .
#,linux/arm64,linux/ppc64le
# ,linux/s390x -- takes too much time to build with it and I don't know why
