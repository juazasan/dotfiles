# Update the apt package list.
sudo apt-get update

# Install Docker's package dependencies.
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update

# Install the latest version of Docker CE.
sudo apt-get install docker-ce -y

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# Install docker-compose
sudo $(which pip3) install --user docker-compose
echo "export PATH=~/.local/bin:$PATH" >> ~/.zprofile && source ~/.zprofile
