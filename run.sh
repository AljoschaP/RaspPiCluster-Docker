chmod +w /home/hduser/.ssh
ssh-keygen -t rsa -f /home/hduser/.ssh/id_rsa
sudo rm /home/hduser/.ssh/authorized_keys
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
sudo rm -r /etc/ssh/ssh*key
sudo dpkg-reconfigure openssh-server
sudo /etc/init.d/ssh start
