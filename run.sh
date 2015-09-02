chmod +w /home/hduser/.ssh
ssh-keygen -t rsa -P "" -f /home/hduser/.ssh/id_rsa
sudo rm /home/hduser/.ssh/authorized_keys
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
sudo rm -r /etc/ssh/ssh*key
sudo dpkg-reconfigure openssh-server
sudo /etc/init.d/ssh start
hadoop namenode -format
/opt/hadoop/bin/start-dfs.sh
/opt/hadoop/bin/start-mapred.sh
alias jps='$JAVA_HOME/bin/jps'
jps
