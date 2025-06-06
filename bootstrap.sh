TERRAFORM_VERSION=1.12.1
echo "UPDATE AND UPGRADE"
apt-get update -y
apt-get upgrade -y
##############################
apt-get install pipx -y
if [ ! -f "/home/vagrant/.local/bin/cookiecutter" ]; then
sudo -H -u vagrant bash -c 'pipx install cookiecutter'
sudo -H -u vagrant bash -c 'pipx ensurepath'
fi
##############################
echo "INSTALL azure-cli"
if [ ! -f "/usr/bin/az" ]; then
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az extension add --name ssh
fi
############################
echo "INSTALL TERRAFORM"
if [ ! -f "/usr/bin/terraform" ]; then
apt install zip -y
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -P /tmp
    unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/
fi
#############################
echo "INSTALL GO"
if [ ! -f "/usr/bin/go" ]; then
apt install golang-go -y
fi
############################
echo "INSTALL DOCKER"
if [ ! -f "/usr/bin/docker" ]; then
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
apt install docker-ce -y
groupadd docker
usermod -aG docker vagrant
fi
#############################
echo "INSTALL KUBECTL"
if [ ! -f "/usr/local/bin/kubectl" ]; then
az aks install-cli
fi

#############################
echo "INSTALL ANSIBLE"
if [ ! -f "/home/vagrant/.local/bin/ansible" ]; then
sudo -H -u vagrant bash -c 'pipx install ansible-core'
fi

#############################
echo "INSTALL MINIKUBE"
if [ ! -f "/usr/local/bin/minikube" ]; then
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
fi
