#!/bin/bash

# Export the environment variables
source .env

# Download the data
kaggle competitions download dogs-vs-cats -p data/

# Decompress the data
unzip data/dogs-vs-cats.zip -d data/
unzip data/train.zip -d data/
unzip data/test1.zip -d data/

# Move the training dogs and cats into seperate directories
mkdir data/train/dog
mkdir data/train/cat
mv data/train/dog.* data/train/dog/
mv data/train/cat.* data/train/cat/

# Clean up
rm data/sampleSubmission.csv
rm data/*.zip