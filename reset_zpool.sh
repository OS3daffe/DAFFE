#! /bin/bash

# NOTE: Run all commands with true to prevent hang on error

# Disable SELinux because fuck this BS
sudo sentenforce 0 || true

# Destroy all docker containers and recreate the ZFS pool
sudo docker rm -f $(docker ps -aq) || true
sudo zpool destroy flocker || true
sudo rm -rf /flocker || true
sudo truncate --size 10G /opt/flocker/pool-vdev || true
sudo zpool create flocker /opt/flocker/pool-vdev || true

# Create new volume UUID (use when cloning VM AMI) but backup old UUID
echo -e "\n Volume UUID on date $(date)" >> ~/volume.json.history
sudo cat /etc/flocker/volume.json >> ~/volume.json.history
sudo rm /etc/flocker/volume.json || true
