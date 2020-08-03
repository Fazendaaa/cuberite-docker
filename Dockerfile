FROM ubuntu:20.04 as BUILDER

ARG MAKEFLAGS="-j $NPROC"
ARG DEBIAN_FRONTEND=noninteractive

RUN [ "apt", "update" ]
RUN [ "apt", "install", "-y", \
    "clang", \
    "cmake", \
    "g++", \
    "gcc", \
    "git", \
    "make" \
]

ARG CC=clang
ARG CXX=clang++

RUN [ "git", "clone", "--recursive", "https://github.com/cuberite/cuberite.git", "/tmp/src" ]

WORKDIR /tmp/src/Release

RUN [ "cmake", "-DCMAKE_BUILD_TYPE=RELEASE", ".." ]
RUN [ "make" ]

FROM ubuntu:20.04 as RUNNER

WORKDIR /cuberite-server

COPY --from=BUILDER /tmp/src/Release .

ENTRYPOINT [ "./Cuberite" ]
