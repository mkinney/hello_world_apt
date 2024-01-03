FROM ubuntu:22.04
LABEL maintainer="mike.kinney@gmail.com"
ARG version
ENV version=${version}
RUN apt-get update && apt-get install -y gcc vim
RUN mkdir -p /root/hello-world_${version}-1_amd64/usr/bin
RUN mkdir /root/hello-world_${version}-1_amd64/DEBIAN
WORKDIR /root
COPY hello.c /root/
COPY control /root/hello-world_${version}-1_amd64/DEBIAN/
RUN gcc -o hello-world hello.c
RUN mv hello-world /root/hello-world_${version}-1_amd64/usr/bin/
RUN dpkg --build /root/hello-world_${version}-1_amd64
RUN dpkg-deb --info /root/hello-world_${version}-1_amd64.deb
RUN dpkg-deb --contents /root/hello-world_${version}-1_amd64.deb
RUN apt-get install /root/hello-world_${version}-1_amd64.deb
