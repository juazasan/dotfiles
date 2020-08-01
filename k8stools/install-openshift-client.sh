#!/bin/bash
mkdir $HOME/tmp/openshift -p
curl -sL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o $HOME/tmp/openshift/oc.tar.gz
tar -C $HOME/tmp/openshift -xf $HOME/tmp/openshift/oc.tar.gz
sudo mv -f $HOME/tmp/openshift/oc /usr/local/bin
sudo chmod +x /usr/local/bin/oc
rm -rf $HOME/tmp/openshift
