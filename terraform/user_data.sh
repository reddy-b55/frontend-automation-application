#!/bin/bash
apt update -y
apt install docker.io awscli -y
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

