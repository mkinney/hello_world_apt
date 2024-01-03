source: https://earthly.dev/blog/creating-and-hosting-your-own-deb-packages-and-apt-repo/

docker build -t mkinney:hello_world_apt .
docker run -it mkinney:hello_world_apt bash
# in another session, run this to get the container id:
docker ps -a
docker cp <container_id>:/root/hello-world_0.0.1-1_amd64.deb .

