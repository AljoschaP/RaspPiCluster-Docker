FROM resin/rpi-raspbian:jessie
MAINTAINER the native web <hello@thenativeweb.io>
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev python wget oracle-java7-jdk
    
RUN addgroup hadoop
RUN adduser --ingroup hadoop hduser
RUN adduser hduser sudo

RUN mkdir ~/.ssh
RUN ssh-keygen -t rsa -P ""
RUN cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

RUN wget http://nodejs.org/dist/v0.10.28/
             node-v0.10.28-linux-arm-pi.tar.gz && \
    tar -xvzf node-v0.10.28-linux-arm-pi.tar.gz && \
    rm node-v0.10.28-linux-arm-pi.tar.gz && \
    mv node-v0.10.28-linux-arm-pi opt/node
