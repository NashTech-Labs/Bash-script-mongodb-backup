#!/bin/bash
set -ex
apt update
apt install wget
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian10-x86_64-100.5.2.deb
dpkg -i mongodb-database-tools-debian10-x86_64-100.5.2.deb

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install --update

sleep 5

bash -x ./env.sh
backup_filename="mongobackup_"$(date +"%d.%m.%y-%H-%M-%S")
echo -e "\nBacking Up ..."
mongodump -h ${MONGO_HOST} -p ${MONGO_PORT} -u ${MONGO_ADMIN_USER} -p ${MONGOPASSWORD} -o ${backup_filename} -v
if [[ $? != 0 ]]
then
    echo "Exiting......"
    exit
fi
sleep 10
echo -e "\nFinished Backup"
tar -czf ${backup_filename}".tar.gz" ${backup_filename}

aws s3 cp ./${backup_filename}".tar.gz" ${BUCKET_NAME}