mkdir $HOME/tmp -p
rm -rf $HOME/tmp/azcopy_linux_amd64_*
curl -L https://aka.ms/downloadazcopy-v10-linux -o $HOME/tmp/azcopy.tar.gz
tar zxvf $HOME/tmp/azcopy.tar.gz -C $HOME/tmp
azcopy_fpath=$(find $HOME/tmp/azcopy_linux_amd64*/azcopy -type f)
		sudo mv $azcopy_fpath /usr/local/bin
		sudo chmod +x /usr/local/bin/azcopy
		rm -rf $HOME/tmp/azcopy_linux_amd64_*
		rm -f $HOME/tmp/azcopy.tar.gz
