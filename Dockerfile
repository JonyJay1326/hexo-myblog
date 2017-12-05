FROM ubuntu
RUN apt-get update \
    &&  apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80

RUN cp -r public/* /var/www/html
    && rm -rf /app
CMD ["nginx","-g","daemon off;"]