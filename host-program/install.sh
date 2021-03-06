#!/bin/bash

sudo apt-get install -y nodejs
sudo apt-get install -y i2c-dev
sudo apt-get install -y xbacklight

wget http://ftp.cn.debian.org/debian/pool/main/d/ddccontrol-db/ddccontrol-db_20061014-4_all.deb
sudo dpkg -i ddccontrol-db_20061014-4_all.deb
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit stuff here
  wget http://ftp.cn.debian.org/debian/pool/main/libx/libxml2/libxml2_2.9.2+dfsg1-3_amd64.deb
  wget http://ftp.cn.debian.org/debian/pool/main/p/pciutils/libpci3_3.2.1-3_amd64.deb
  wget http://ftp.cn.debian.org/debian/pool/main/d/ddccontrol/libddccontrol0_0.4.2-11_amd64.deb
  wget http://ftp.cn.debian.org/debian/pool/main/d/ddccontrol/ddccontrol_0.4.2-11_amd64.deb
  sudo dpkg -i libxml2_2.9.2+dfsg1-3_amd64.deb
  sudo dpkg -i libpci3_3.2.1-3_amd64.deb
  sudo dpkg -i libddccontrol0_0.4.2-11_amd64.deb
  sudo dpkg -i ddccontrol_0.4.2-11_amd64.deb
  echo "64-bit"
else
  # 32-bit stuff here
  wget http://ftp.cn.debian.org/debian/pool/main/libx/libxml2/libxml2_2.9.2+dfsg1-3_i386.deb
  wget http://ftp.cn.debian.org/debian/pool/main/p/pciutils/libpci3_3.2.1-3_i386.deb
  wget http://ftp.cn.debian.org/debian/pool/main/d/ddccontrol/libddccontrol0_0.4.2-11_i386.deb
  wget http://ftp.cn.debian.org/debian/pool/main/d/ddccontrol/ddccontrol_0.4.2-11_i386.deb
  sudo dpkg -i libxml2_2.9.2+dfsg1-3_i386.deb
  sudo dpkg -i libpci3_3.2.1-3_i386.deb
  sudo dpkg -i libddccontrol0_0.4.2-11_i386.deb
  sudo dpkg -i ddccontrol_0.4.2-11_i386.deb
  echo "32-bit"
fi

echo "Downloading Node Modules"
sudo npm install
git clone https://github.com/node-hid/node-hid.git node_modules/node-hid
