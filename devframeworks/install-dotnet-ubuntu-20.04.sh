wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O $HOME/tmp/packages-microsoft-prod.deb
sudo dpkg -i $HOME/tmp/packages-microsoft-prod.deb
rm $HOME/tmp/packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0