sudo apt-get update

FILE=/ssh/id_rsa

if [ -f $FILE ];
then
cp $FILE /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa
fi
