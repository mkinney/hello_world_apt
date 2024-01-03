source: https://earthly.dev/blog/creating-and-hosting-your-own-deb-packages-and-apt-repo/

created hello.c

created a docker instance to build hello using ubuntu
  docker run -it ubuntu:22.04 bash
  apt-get update
  apt-get install gcc vim
  vim hello.c
  gcc -o hello-world hello.c

copy the binary back to the mac:
  Use "docker ps -a" to get the container id, in this case: "b5b2dccd9a8a"
  docker cp b5b2dccd9a8a:/hello-world .

mkdir -p hello-world_0.0.1-1_amd64
cd hello-world_0.0.1-1_amd64
mkdir -p usr/bin
cp hello-world hello-world_0.0.1-1_amd64/usr/bin
mkdir DEBIAN
echo "Package: hello-world
Version: 0.0.1
Maintainer: example <example@example.com>
Depends: libc6
Architecture: amd64
Homepage: http://example.com
Description: A program that prints hello" \
> ~/example/hello-world_0.0.1-1_amd64/DEBIAN/control
