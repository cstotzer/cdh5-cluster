#!/usr/bin/env bash
sed '/#DYN/d' /etc/hosts | sudo tee /etc/hosts
sudo docker ps -q | while read id ; do
  name=$(sudo docker inspect --format="{{.Config.Hostname}}" $id)
  domain=$(sudo docker inspect --format="{{.Config.Domainname}}" $id)
  ip=$(sudo docker inspect --format="{{.NetworkSettings.IPAddress}}" $id)
  echo "$ip $name.$domain $name #DYN" | sudo tee -a /etc/hosts
done
