FROM resin/rpi-raspbian:jessie
MAINTAINER the native web <hello@thenativeweb.io>
RUN apt-get update
RUN apt-get install -y build-essential libssl-dev python wget openssh-server
    
RUN addgroup hadoop
RUN adduser --ingroup hadoop hduser
RUN adduser hduser sudo

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

RUN wget http://h2380793.stratoserver.net/jdk-8u60-linux-arm32-vfp-hflt.tar.gz
RUN tar zxvf jdk-8u60-linux-arm32-vfp-hflt.tar.gz -C /opt

RUN update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.8.0_60/bin/java" 1 

RUN wget http://apache.mirrors.spacedump.net/hadoop/core/hadoop-1.2.1/hadoop-1.2.1.tar.gz
RUN tar -xvzf hadoop-1.2.1.tar.gz -C /opt/
RUN mv /opt/hadoop-1.2.1 /opt/hadoop
RUN chown -R hduser:hadoop /opt/hadoop

RUN export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
RUN export HADOOP_INSTALL=/opt/hadoop
RUN export PATH=$PATH:$HADOOP_INSTALL/bin

EXPOSE 22
ENTRYPOINT ["/bin/bash"]

