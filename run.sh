echo -e  'y\n'|sudo ssh-keygen -q -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo rm -r /etc/ssh/ssh*key
sudo dpkg-reconfigure openssh-server 
sudo /etc/init.d/ssh start
