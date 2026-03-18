# Pull the Ubuntu image
FROM ubuntu:latest

# Author info
LABEL maintainer="Ireneusz Witek <s101693@pollub.edu.pl>"

# Install Ubuntu
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y apache2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Copy site to server
COPY index.html /var/www/html/index.html

# Expose the port for access
EXPOSE 80

# Run the Apache server
CMD ["apachectl", "-D", "FOREGROUND"]