curl -L https://aka.ms/downloadazcopy-v10-linux -o $HOME/tmp/azcopy.tar.gz
tar zxvf $HOME/tmp/azcopy.tar.gz -C $HOME/tmp
sudo mv $HOME/tmp/azcopy_linux_amd64_10.6.0/azcopy /usr/local/bin
sudo chmod +x /usr/local/bin/azcopy
rm -rf $HOME/azcopy_linux_amd64_10.6.0
rm -f $HOME/tmp/helm.tar.gz
