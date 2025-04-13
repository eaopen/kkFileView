#!/bin/bash
cd /tmp

install_redhat() {
  wget https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.6.7/rpm/x86_64/LibreOffice_7.6.7_Linux_x86-64_rpm.tar.gz -cO LibreOffice_7_rpm.tar.gz && tar -zxf /tmp/LibreOffice_7_rpm.tar.gz && cd /tmp/LibreOffice_7.6.7.2_Linux_x86-64_rpm/RPMS
  echo $?
  if [ $? -eq 0 ];then
    yum install -y mkfontscale fontconfig libSM.x86_64 libXrender.x86_64 libXext.x86_64
    yum groupinstall -y  "X Window System"
    yum localinstall -y *.rpm
    rm -f /tmp/LibreOffice_7_rpm.tar.gz
    rm -rf /tmp/LibreOffice_7.6.7.2_Linux_x86-64_rpm
    echo 'install finshed...'
  else
    echo 'download package error...'
  fi
}

install_ubuntu() {
  sudo wget https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.6.7/deb/x86_64/LibreOffice_7.6.7_Linux_x86-64_deb.tar.gz -cO LibreOffice_7_deb.tar.gz && sudo tar -zxf /tmp/LibreOffice_7_deb.tar.gz && cd /tmp/LibreOffice_7.6.7.2_Linux_x86-64_deb/DEBS
  echo $?
  if [ $? -eq 0 ];then
    sudo apt-get install -y ttf-mscorefonts-installer fontconfig libxinerama1 libcairo2 libcups2 libx11-xcb1 libsm6 libXrender1 libxext-dev
    sudo dpkg -i *.deb
    sudo rm -f /tmp/LibreOffice_7_rpm.tar.gz
    sudo rm -rf /tmp/LibreOffice_7.6.7.2_Linux_x86-64_deb
    echo 'install finshed...'
  else
    echo 'download package error...'
 fi
}


if [ -f "/etc/redhat-release" ]; then
  yum install -y wget
  install_redhat
else
  apt-get install -y wget
  install_ubuntu
fi
