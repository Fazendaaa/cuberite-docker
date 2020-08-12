FROM ubuntu:20.04 as BUILDER

ARG MAKEFLAGS="-j $NPROC"
ARG DEBIAN_FRONTEND=noninteractive

RUN [ "apt", "update" ]
RUN [ "apt", "install", "-y", \
    "curl", \
    "clang", \
    "cmake", \
    "g++", \
    "gcc", \
    "git", \
    "make" \
]

RUN echo "D" | sh -c "$(curl -sSfL -o - https://compile.cuberite.org)"

ENV ADMIN_USERNAME=admin 
ENV ADMIN_PASSWORD=Swordfish 
ENV MAX_PLAYERS=30

COPY webadmin.ini .

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 25565

# ENTRYPOINT [ "./Cuberite -d" ]
