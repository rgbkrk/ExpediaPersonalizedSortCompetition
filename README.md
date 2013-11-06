Expedia Personalized Sort Competition
=====================================

This fork of the Expedia Personalized Sort Competition repo contains guidance and scripts for setting up the python benchmark for the  [Expedia Personalized Sort Competition](https://www.kaggle.com/c/expedia-personalized-sort), a machine learning challenged hosted by [Kaggle](https://www.kaggle.com) in conjunction with [Expedia](http://www.expedia.com/).

We'll be focused on doing this on a remote box, tailored for Rackspace's Performance Cloud Servers.

# Getting setup

To get up and running, install git via

```bash
$ apt-get install -y git unzip
```

## Clone this repository

```bash
$ git clone https://github.com/rgbkrk/ExpediaPersonalizedSortCompetition
```

## Get the data

Since I'm not sure what the restrictions are on the data itself, you'll need to get the zip files over yourself. This involves downloading it and transferring it or handing your cookies to wget.

```bash
# Exported cookies via the "Chrome to cookie.txt" extension
wget --load-cookies=cookies.txt http://www.kaggle.com/c/expedia-personalized-sort/download/data.zip

# Optionally, grab the generated benchmark data
# You'll be making your own
wget --load-cookies=cookies.txt http://www.kaggle.com/c/expedia-personalized-sort/download/basicPythonBenchmark.zip
wget --load-cookies=cookies.txt http://www.kaggle.com/c/expedia-personalized-sort/download/testOrderBenchmark.zip
wget --load-cookies=cookies.txt http://www.kaggle.com/c/expedia-personalized-sort/download/randomBenchmark.zip
 
# unzip 'em all
unzip '*.zip'
```

## Run the bootstrap script

Then run the `bootstrap.sh` script

```bash
$ ./bootstrap.sh
```

## It's all manual from here

You should now be in a virtualenv labeled expedia_benchmark. If not, type 

Next you need to switch to the "PythonBenchmark" directory, 

Modify SETTINGS.json to include the paths to the data files, as well as a place to save the trained model and a place to save the submission

Train the model by running `python train.py`

Make predictions on the validation set by running `python predict.py`

The original author of this code stated that "This benchmark took less than 5 minutes to execute on a Windows 8 laptop with 8GB of RAM and 4 cores at 2.7GHz."

On a performance cloud server it took 43.2s to train the model and 1.2 minutes to make predicitons on the validation set.

This is without optimizing the BLAS/LAPACK/ATLAS install and only used one core. Set `n_jobs` higher within train.py to see how performance changes. 

