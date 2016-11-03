FROM debian
MAINTAINER Lita Li<litalidev@gmail.com>

RUN apt-get update && apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor

RUN echo 'root:rootpw' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
CMD ["/usr/bin/supervisord"]
