#!/bin/bash
export DEBIAN_FRONTEND="noninteractive"

# Sleep
echo ">>>>>>>>>> Sleeping for 15 seconds... <<<<<<<<<<"
sleep 15

# Install packages
echo ">>>>>>>>>> Updating packages... <<<<<<<<<<"
sudo apt-get update
echo ">>>>>>>>>> Installing packages... <<<<<<<<<<"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    lsb-release \
    zip \
    wget \
    git \
    maven \
    npm \
    openjdk-8-jdk \
    openjdk-17-jdk \
    openjdk-11-jdk \
    python \
    python3

# Install AzureCLI
echo ">>>>>>>>>> AzureCLI <<<<<<<<<<"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install AWS
echo ">>>>>>>>>> AWS <<<<<<<<<<"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Kubectl
echo ">>>>>>>>>> Kubectl <<<<<<<<<<"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm
echo ">>>>>>>>>> Helm <<<<<<<<<<"
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# Install Terraform & Packer
echo ">>>>>>>>>> Terraform & Packer <<<<<<<<<<"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform packer

# Install Grype
echo ">>>>>>>>>> Grype <<<<<<<<<<"
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin

# Install Docker
echo ">>>>>>>>>> Docker <<<<<<<<<<"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install IBM JDK 1.8
echo ">>>>>>>>>> IBM JDK 1.8 <<<<<<<<<<"

# Setup Environment Variables
echo ">>>>>>>>>> Setting up environment variables... <<<<<<<<<<"
echo "JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64/bin/java" >> /etc/environment
echo "JAVA_HOME_11_X64=/usr/lib/jvm/java-11-openjdk-amd64/bin/java" >> /etc/environment
echo "JAVA_HOME_17_X64=/usr/lib/jvm/java-17-openjdk-amd64/bin/java" >> /etc/environment
