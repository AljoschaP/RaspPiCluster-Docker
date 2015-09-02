FROM resin/rpi-raspbian:jessie
MAINTAINER the native web <hello@thenativeweb.io>
RUN apt-get update
RUN apt-get install -y build-essential libssl-dev python wget openssh-server
    
RUN addgroup hadoop
RUN adduser --ingroup hadoop hduser
RUN adduser hduser sudo

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

USER hduser
RUN mkdir ~/.ssh

USER root

RUN wget http://h2380793.stratoserver.net/jdk-8u60-linux-arm32-vfp-hflt.tar.gz
RUN tar zxvf jdk-8u60-linux-arm32-vfp-hflt.tar.gz -C /opt

RUN update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.8.0_60/bin/java" 1 

RUN wget http://apache.mirrors.spacedump.net/hadoop/core/hadoop-1.2.1/hadoop-1.2.1.tar.gz
RUN tar -xvzf hadoop-1.2.1.tar.gz -C /opt/
RUN mv /opt/hadoop-1.2.1 /opt/hadoop
RUN chown -R hduser:hadoop /opt/hadoop

COPY bashrc home/hduser/.bashrc

COPY conf/hadoop/ /opt/hadoop/conf/

RUN mkdir -p /hdfs/tmp
RUN chown hduser:hadoop /hdfs/tmp
RUN chmod 750 /hdfs/tmp

RUN passwd -d root
RUN passwd -d hduser

EXPOSE 22
COPY run.sh /run.sh

RUN chmod 777 /run.sh

USER hduser

CMD["/run.sh"]
