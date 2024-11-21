#!/bin/bash

source .env
kaggle competitions download dogs-vs-cats -p data/
unzip dogs-vs-cats.zip
unzip data/train.zip
unzip data/test1.zip
mkdir data/train/dog
mkdir data/train/cat
mv data/train/dog.* data/train/dog/
mv data/train/cat.* data/train/cat/