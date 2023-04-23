FROM ubuntu:latest

RUN apt update && \
    apt install git make build-essential -y
WORKDIR /better_have_my_build
COPY * .
ENV GIT_REPO="https://github.com/madler/zlib.git"
ENV GIT_TAG="v1.2.13"
RUN git clone --bare --no-checkout --branch $GIT_TAG $GIT_REPO
RUN cd zlib && ./configure --prefix=/better_have_my_build/output && make && make install
