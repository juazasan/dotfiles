#!/bin/bash
mkdir $HOME/tmp/openshift -p
curl -sL https://github.com/openshift/okd/releases/download/4.3.0-0.okd-2019-11-15-182656/openshift-client-linux-4.3.0-0.okd-2019-11-15-182656.tar.gz -o $HOME/tmp/openshift/oc.tar.gz
tar -C $HOME/tmp/openshift -xf $HOME/tmp/openshift/oc.tar.gz
sudo mv -f $HOME/tmp/openshift/oc /usr/local/bin
sudo chmod +x /usr/local/bin/oc
curl -sL https://github.com/openshift/okd/releases/download/4.3.0-0.okd-2019-11-15-182656/openshift-install-linux-4.3.0-0.okd-2019-11-15-182656.tar.gz -o $HOME/tmp/openshift/oc-install.tar.gz
tar -C $HOME/tmp/openshift -xf $HOME/tmp/openshift/oc-install.tar.gz
sudo mv -f $HOME/tmp/openshift/openshift-install /usr/local/bin
sudo chmod +x /usr/local/bin/openshift-install
rm -rf $HOME/tmp/openshift
