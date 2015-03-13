#! /bin/bash

echo "Deploying to server 1..."
flocker-deploy -v deployment-server1.yml application.yml
read -p "Press [Enter] key to migrate to server 2..."
flocker-deploy -v deployment-server2.yml application.yml
echo "Migration done!"

