#!/usr/bin/env bash

# Wise to update first
sudo apt-get update
 
# Pre-requisites to download
sudo apt-get install -y unzip git wget curl

# Pre-requisites for the Python benchmark
sudo apt-get install -y build-essential python-dev python-numpy python-setuptools python-scipy libatlas-dev liblapack3 libatlas3-base gcc g++ gfortran

# setuptools then pip
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python2.7
curl --show-error --retry 5 https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python2.7
 
# Virtualenvburrito
curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | $SHELL
 
source $HOME/.venvburrito/startup.sh
 
mkvirtualenv expedia_benchmark
 
# The basic packages we need, just for the benchmarks
pip install numpy scipy scikit-learn pandas
