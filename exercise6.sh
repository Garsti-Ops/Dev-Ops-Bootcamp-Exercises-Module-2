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

# prepare environment
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# change into directory
cd ./package

# running the app
npm install
nohup node server.js &
