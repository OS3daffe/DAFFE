#! /bin/bash

# NOTE: Run all commands with true to prevent hang on error

# Disable SELinux because fuck this BS
sudo setenforce 0 || true

# Destroy all docker containers and recreate the ZFS pool
sudo docker rm -f $(docker ps -aq) || true
sudo zpool destroy -f flocker
sudo rm -rf /flocker || true
sudo truncate --size 9G /opt/flocker/pool-vdev || true
sudo zpool create -f flocker /opt/flocker/pool-vdev
sudo chmod -R 777 /flocker
sudo chown root /flocker

# Create new volume UUID (use when cloning VM AMI) but backup old UUID
echo -e "\n Volume UUID on date $(date)" >> ~/volume.json.history
sudo cat /etc/flocker/volume.json >> ~/volume.json.history
sudo rm /etc/flocker/volume.json || true

# Really really disable this
sudo setenforce 0 || true


# TIP: when server is fooked reset pool with:
# sudo rm -rf /flocker
# sudo rm -rf /opt/flocker/pool-vdev
# sudo rm /etc/zfs/zpool.cache
# sudo reboot

# TIP: check diskspace used with:
# df -h
