#!/bin/bash
DIRECTORY="/vagrant/src"
if [ ! -d "${DIRECTORY}/jenkins" ]; then
echo "********* Initial Configuration *********"
  cp -R /var/lib/jenkins/ ${DIRECTORY}
fi
#sudo chown -h jenkins:jenkins /var/lib/jenkins
rm  -rf /var/lib/jenkins
ln -s ${DIRECTORY}/jenkins /var/lib/jenkins
sudo service jenkins restart 