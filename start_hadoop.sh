echo "SETUP AND START HADOOP"
echo "*********************************"
echo "GET authorized keys"
sshpass -p 'toor' scp -P 20002 keyuser@node01:~/.ssh/authorized_keys ~/.ssh/
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
