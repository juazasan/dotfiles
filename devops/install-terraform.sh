#!/bin/bash
curl -L https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip -o $HOME/tmp/terraform.zip
unzip -q $HOME/tmp/terraform.zip -d $HOME/tmp/terraform
sudo mv $HOME/tmp/terraform/terraform /usr/local/bin
rm -rf $HOME/tmp/terraform
rm -f $HOME/tmp/terraform.zip
