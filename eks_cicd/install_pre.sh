#!/bin/bash

mkdir -p $HOME/bin
export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
#kubectl

if type kubectl;
then
echo "kubectl installed already"
else
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl $HOME/bin/kubectl
kubectl version
fi
#iam autheticator

if type aws-iam-authenticator;
then
echo "aws-iam-authenticator installed already"
else
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator
aws-iam-authenticator version
fi


if type aws;
then
echo "aws cli installed already"
else
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -i $HOME/aws-cli -b $HOME/bin
aws  --version
fi

if type eksctl;
then
echo "ekctl installed already"
else
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C $HOME/bin
chmod +x $HOME/bin/eksctl
eksctl version
fi
aws sts get-caller-identity