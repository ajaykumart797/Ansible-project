#  Use a base image with Nginx pre-installed
# FROM nginx:latest

# # Expose port 80 for Nginx
# EXPOSE 80
FROM  centos:latest
MAINTAINER abc@gmail.com
RUN yum install -y httpd zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
