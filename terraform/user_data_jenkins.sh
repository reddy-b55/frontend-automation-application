#!/bin/bash
set -e

# Update system
apt update -y

# Install Java (required for Jenkins)
apt install -y openjdk-17-jdk

# Install Docker
apt install -y docker.io
systemctl start docker
systemctl enable docker

# Add users to docker group
usermod -aG docker ubuntu
usermod -aG docker jenkins || true

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ \
  > /etc/apt/sources.list.d/jenkins.list

apt update -y
apt install -y jenkins

systemctl enable jenkins
systemctl start jenkins

