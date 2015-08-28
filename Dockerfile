FROM resin/rpi-raspbian:jessie
MAINTAINER the native web <hello@thenativeweb.io>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential libssl-dev python wget 
    
RUN addgroup hadoop
RUN adduser --ingroup hadoop hduser
RUN adduser hduser sudo

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

COPY ejdk-8u51-linux-arm-sflt.tar.gz /ejdk-8u51-linux-arm-sflt.tar.gz

RUN sudo tar zxvf ejdk-8u51-linux-arm-sflt.tar.gz -C /opt

RUN sudo update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.8.0/bin/java" 1 

EXPOSE 22
ENTRYPOINT ["/bin/bash"]

