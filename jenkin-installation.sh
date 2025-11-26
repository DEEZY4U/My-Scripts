#!/bin/bash
set -e

# -------------------------------
# Jenkins Installation Script
# -------------------------------

echo "Updating system..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing Java (required by Jenkins)..."
sudo apt install -y fontconfig openjdk-21-jre
java -version

echo "Adding Jenkins repository key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "Adding Jenkins repository..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package index..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Enabling and starting Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Checking service status..."
sudo systemctl status jenkins --no-pager

echo "Fetching initial admin password..."
echo "-----------------------------------------"
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "-----------------------------------------"

echo "Jenkins installation completed!"
echo "Access Jenkins at: http://localhost:8080 or at host's public ip"

