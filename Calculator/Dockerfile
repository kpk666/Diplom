FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y install apache2
COPY bgImg.jpg index.html script.js style.css /var/www/html/
CMD ["usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80