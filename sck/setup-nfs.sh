#!/bin/bash


# download necessary tools
echo "Installing requirement..."
sudo apt-get update
sudo apt-get install -y wget git


# download old hadoop pbse
echo "Downloading hadoop base code..."
#wget https://people.cs.uchicago.edu/~riza/ucare_se/hadoop-2.7.1.tar.gz
#tar -xvzf hadoop-2.7.1.tar.gz
#rm hadoop-2.7.1.tar.gz
git clone https://github.com/ucare-uchicago/hadoop.git hadoop-2.7.1
echo "==============================="


# sparse checkout hadoop-ucare repo
echo "Downloading hadoop configurations and scripts..."
mkdir hadoop-ucare
cd hadoop-ucare
git init
git config core.sparsecheckout true
echo "BUILDING_UCARE.txt" >> .git/info/sparse-checkout
echo "psbin/" >> .git/info/sparse-checkout
git remote add ucare-github https://github.com/ucare-uchicago/hadoop.git
git pull ucare-github ucare_se --depth=10
git checkout ucare_se
cd ..
echo "==============================="


# checkout SWIM project
echo "Downloading benchmarking scripts..."
git clone https://github.com/ucare-uchicago/SWIM.git SWIM
cd SWIM
git checkout ucare_se
cd ..
echo "==============================="

# creating shared ssh keys
#echo "Creating shared ssh keys..."
#mkdir .ssh
#ssh-keygen -t rsa -b 4096 -C "hsg.ucare@gmail.com" -f .ssh/id_rsa
#echo "Host * StrictHostKeyChecking no" >> .ssh/config
#echo "==============================="



# changing ownership of everything back to ubuntu
#echo "Setting up ownership..."
#sudo chown -R ubuntu hadoop-2.7.1/ hadoop-ucare/ SWIM/ .ssh/

