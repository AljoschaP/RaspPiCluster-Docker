FROM resin/rpi-raspbian:jessie
MAINTAINER the native web <hello@thenativeweb.io>
RUN apt-get update
RUN apt-get install -y build-essential libssl-dev python wget openssl-server
    
RUN addgroup hadoop
RUN adduser --ingroup hadoop hduser
RUN adduser hduser sudo

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

RUN wget http://download.oracle.com/otn/java/ejdk/8u51-b16/ejdk-8u51-linux-arm-sflt.tar.gz
RUN sudo tar zxvf ejdk-8u51-linux-arm-sflt.tar.gz -C /opt

RUN sudo update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.8.0/bin/java" 1 

EXPOSE 22
ENTRYPOINT ["/bin/bash"]

