source: https://earthly.dev/blog/creating-and-hosting-your-own-deb-packages-and-apt-repo/

version=0.0.1
docker build -t mkinney:hello_world_apt --build-arg version=${version} .
docker run -it mkinney:hello_world_apt bash
# in another terminal session, run this to get the container id:
docker ps -a
# have to export the version again in the new terminal session
version=0.0.1
docker cp <container_id>:/root/hello-world_${version}-1_amd64.deb .

