su hduser
ssh-keygen -q -t rsa -N "" -f /keys/id_rsa
echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f /keys/id_rsa
cp /keys/id_rsa ~/.ssh/
cp /keys/id_rsa.pub ~/.ssh/
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

