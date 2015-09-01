chmod +w /home/hduser/.ssh
echo -e "y\n" | ssh-keygen -t rsa -F ~/.ssh/id_rsa
sudo rm ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo rm -r /etc/ssh/ssh*key
sudo dpkg-reconfigure openssh-server
sudo /etc/init.d/ssh start
