FROM ubuntu:22.04
RUN apt update
RUN apt install nginx zip curl -y
RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/jagadeesh9666/2048/zip/master
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 80
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf" ]