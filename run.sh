echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f /keys/id_rsa
cat /keys/id_rsa.pub > /home/hduser/.ssh/authorized_keys
