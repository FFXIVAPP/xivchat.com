#!/bin/sh
# ROOT_UID=0
#
# # Run as root
# if [ "$UID" -ne "$ROOT_UID" ]; then
#   echo "Must be root to run this script."
#   exit
# fi

LAUNCH_DIR=${PWD}

systemctl disable xivchat.com.service
stop xivchat.com.service

cd ..

rm -rf node_modules/
yarn
# ensure conf files
cd $LAUNCH_DIR
yes | cp -f xivchat.com.service /etc/systemd/system/xivchat.com.service
yes | cp -f xivchat.com.nginx.conf /etc/nginx/conf.d/xivchat.com.conf

systemctl start xivchat.com.service
systemctl enable xivchat.com.service

nginx -s reload
