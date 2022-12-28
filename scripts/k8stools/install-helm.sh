helm_version="3.10.3"
curl -L https://get.helm.sh/helm-v$helm_version-linux-amd64.tar.gz -o $HOME/tmp/helm.tar.gz
tar zxvf $HOME/tmp/helm.tar.gz -C $HOME/tmp
sudo mv $HOME/tmp/linux-amd64/helm /usr/local/bin
sudo chmod +x /usr/local/bin/helm
helm repo add stable https://charts.helm.sh/stable
rm -rf $HOME/linux-amd64
rm -f $HOME/tmp/helm.tar.gz
