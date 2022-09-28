# Pulling ubuntu to have basic commands
FROM ubuntu

LABEL org.opencontainers.image.authors="bastian.somon@gmail.com"

# Installing nginx (and nano for editing just in case)
RUN apt-get update 
RUN apt-get install -y nginx

# Installing SSH server
RUN apt-get install -y openssh-server

# Installing usefull tools but you might not need it (comment if needed)
RUN apt-get install -y git
RUN apt-get install -y nano
RUN apt-get install -y net-tools
RUN apt-get install -y vim

# Copy the nginx config file
COPY nginx.conf /etc/nginx/

# Exposing port 80 for Nginx
EXPOSE 80/tcp

# Exoposing port 22 for SSH
EXPOSE 22

# Creating super user for ssh connection
RUN apt-get install sudo
RUN useradd -d /home/nginx -m -p $(echo "nginx" | openssl passwd -1 -stdin) nginx
RUN usermod -aG sudo nginx

# Running the server
CMD ["/bin/bash", "-c", "service ssh start;nginx -g 'daemon off;'"]
