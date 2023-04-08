#!/bin/bash

# install node
apt update
apt install nodejs
echo "node version: "
node --version

# install npm
apt install npm
echo "npm version: "
npm --version

# get file from remote
curl -o node-app.tgz https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

# unzip
tar zxvf node-app.tgz

# get log dir from user
read -p "enter log directory " log_dir

if [ ! -d "$log_dir" ]
then
	echo "creating log dir"
	mkdir $log_dir
fi

# prepare environment
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
export LOG_DIR="$log_dir"

# change into directory
cd ./package

# running the app
npm install
node server.js &

# output port
netstat -ltnp | grep 3000,

# output process id
ps aux | grep "node server.js"
