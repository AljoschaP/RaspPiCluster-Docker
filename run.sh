echo "*********************************"
echo "BEGIN SETUP HADOOP NODE"
echo "*********************************"
chmod +w /home/hduser/.ssh
echo "*********************************"
echo "GENERATING SSH KEYS"
echo "*********************************"
ssh-keygen -t rsa -P "" -f /home/hduser/.ssh/id_rsa
sudo rm /home/hduser/.ssh/authorized_keys
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
sudo rm -r /etc/ssh/ssh*key
echo "*********************************"
echo "RECONFIGURE SSH SERVER"
echo "*********************************"
sudo dpkg-reconfigure openssh-server
sudo /etc/init.d/ssh start
echo "*********************************"
echo "SETUP AND START HADOOP"
echo "*********************************"
hadoop namenode -format
/opt/hadoop/bin/start-dfs.sh
/opt/hadoop/bin/start-mapred.sh
alias jps='$JAVA_HOME/bin/jps'
echo "*********************************"
echo "END SETUP"
echo "RESULT:"
echo "*********************************"
jps
echo "*********************************"
echo "START HADOOP TEST"
echo "*********************************"
hadoop dfs -copyFromLocal /opt/hadoop/LICENSE.txt /license.txt
hadoop jar /opt/hadoop/hadoop-examples-1.2.1.jar wordcount /license.txt /license-out.txt
echo "*********************************"
echo "END HADOOP TEST"
echo "*********************************"
