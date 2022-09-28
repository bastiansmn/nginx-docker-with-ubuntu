# nginx-docker-with-ubuntu
A starter project to easily simulate a Nginx server (inside a docker container) with help of common ubuntu commands.

# Usage :

First, I highly encourage you to create a volume dedicated to your in-docker Nginx server.

```bash
docker volume create nginx-server-volume
```

And then you can build and run the container with the volume associated.
```
docker build . -t nginx-server
```

```bash
docker run  \
   --name nginx-server \
   -d \
   -p 80:80 \
   -p 2222:22 \
   -v nginx-sever-volume:/volume \
   nginx-server 
```

Alternatively, you can simple run `./run.sh`, the script will do everything to create the docker container for you.

Once the docker container is running, you can connect it via SSH with the command below. The password is just `nginx`. You can change that in the Dockerfile line 28 (`$(echo "<your_password>" ...`)

```bash
ssh nginx@localhost -p 2222
```

Note that the nginx user is already a super user, so you don't need to grant any permissions.

Once everything is set up, you can edit your ssh config file to easily connect to the fake server.

```
...

Host nginx-docker
    HostName localhost
    User nginx
    AddKeysToAgent yes
    Port 2222
```