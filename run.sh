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
sudo sshpass -p 'toor' ssh-copy-id -oStrictHostKeyChecking=no -i /home/hduser/.ssh/id_rsa.pub keyuser@node01 
