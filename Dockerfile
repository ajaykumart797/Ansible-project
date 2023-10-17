# Use the Ubuntu base image
FROM ubuntu:latest

MAINTAINER codetech@gmail.com
# Update the package list and install required packages using apt
RUN apt-get update && apt-get install -y apache2 zip unzip curl && apt-get clean

# Download and extract the zip file (make sure the URL is correct and accessible)
RUN curl -o /tmp/photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
    && unzip /tmp/photogenic.zip -d /var/www/html/ \
    && rm /tmp/photogenic.zip

# Start the Apache HTTP server
CMD ["apache2ctl", "-D", "FOREGROUND"]
