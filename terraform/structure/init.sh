#! /bin/env bash

# install_docker
echo "Docker installing..."
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "Docker success instaled"


sudo curl -SL https://github.com/docker/compose/releases/download/v2.17.0/docker-compose-linux-x86_64 -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# configuring docker for remote connect
echo "Docker configuring..."
IP=$(hostname -i)
sudo bash -c "cat <<EOF > /etc/docker/daemon.json
{
  \"debug\": true,
  \"hosts\": [\"tcp://$IP\", \"unix:///var/run/docker.sock\" ]
}
EOF"
sudo sed -i 's/ -H fd:\/\///g' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker
echo "Docker success configured"

# github install
mkdir /home/ubuntu/git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null 
sudo apt update 
sudo apt install gh
echo "Installation of gh is complited"
echo "Clonning git repository"
cd /home/ubuntu/git && git clone https://github.com/kpk666/Diplom.git