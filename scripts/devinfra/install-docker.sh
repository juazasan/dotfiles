# Update the apt package list.
sudo apt-get update

# Install Docker's package dependencies.
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Download and add Docker's official public PGP key.
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package list (for the new apt repo).
sudo apt-get update

# Install the latest version of Docker CE.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
newgrp docker

echo "export PATH=~/.local/bin:$PATH" >> ~/.zprofile && source ~/.zprofile
