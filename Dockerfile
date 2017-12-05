FROM ubuntu
RUN apt-get update \
    &&  apt-get install -y nginx 
EXPOSE 80

RUN cp -r public/* /var/www/html
CMD ["nginx","-g","daemon off;"]