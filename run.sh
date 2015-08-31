ssh-keygen -q -t rsa -N "" -f /keys/id_rsa
cat /keys/id_rsa.pub > ~/.ssh/authorized_keys
