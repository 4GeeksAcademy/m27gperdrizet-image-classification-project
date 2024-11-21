# Image classification environment set-up

The machine learning project template repository provided via the project tutorial on 4Geeks is not sufficient to complete this project. Take a look for yourself, the reading materials and provided solution use Google's TensorFlow - which is not included in the `requirements.txt`. Using this fork of the repo will get you up and running in a codespace in just a few minutes.

## 1. Get a Kaggle account

The dataset is hosted on Kaggle. To download it you need a free account. It's easy to set up via the link below, all you need is an email address:

[Login or Register | Kaggle](https://www.kaggle.com/account/login?phase=startRegisterTab)

Once you have an account, you need to generate and save an API access token so that you can download the dataset from within a codespace:

- From the homepage, click on your profile in the upper left
- Select 'Settings'
- Under API, click 'Create New Token'
- Click 'Continue'
- Save the key file on you local machine

The contents of the file should look like this:

```json
{"username":"your-user-name","key":"a-bunch-of-letters-and-numbers"}
```

## 2. Start a codespace

Training neural networks requires significant computational power. I have requested access to 8-core machines from 4Geeks for this project. Hopefully, this request will be approved by the time you are reading this. If not, we will have to stick with the usual dual core machines. The project will still work, but training the image classifier will take much longer.

From this repository:

- Click the 'Code' dropdown
- Select the 'Codespaces' tab
- Click the three dot menu at the top left of the Codespaces dropdown
- Select 'New with options'
- Change 'Machine type' to '8-core'
- Click 'Create codespace'

## 3. Add your Kaggle API key

From your codespace, open the .env file and add your Kaggle username and key from the `kaggle.json` file you downloaded to your computer from the Kaggle site earlier.

```bash
export KAGGLE_USERNAME=your-user-name
export KAGGLE_KEY=a-bunch-of-letters-and-numbers
```

Then, source the environment file to export the environment variables to the codespace shell:

```bash
source .env
```

Now, your username and key are stored in `KAGGLE_USERNAME` and `KAGGLE_KEY` respectively. Placing them in environment variables makes them available to any application running in the codespace. Test it with:

```bash
echo $KAGGLE_USERNAME
```

## 4. Install requirements

This step is the same as usual, but uses an updated `requirements.txt` which includes TensorFlow and some image manipulation utilities.

```bash
pip install -r ./requirements.txt
```

## 5. Download and prepare the data

Finally, we can download the image dataset using the Kaggle CLI. We then need to decompress it and structure the directories so that we can use TensorFlow and Keras to create an image dataset.

Download the data to `data/`:

```bash
mkdir data
cd data
kaggle competitions download -c dogs-vs-cats
```

Inside `dogs-vs-cats.zip` there are individual zip archives for the testing and training data. Unzip `dogs-vs-cats.zip` followed by `train.zip` and `test1.zip`.

```bash
unzip dogs-vs-cats.zip
unzip train.zip
unzip test1.zip
```

Keras expects to see our training data structured such that each image class is in its own folder. To do this, make `dog` and `cat` folders inside the training data directory and move the dog and cat images into them.

```bash
cd train
mkdir dog
mkdir cat
mv ./dog.* ./dog/
mv ./cat.* ./cat/
```

Easy! Now we are ready to start working on the solution in a notebook.
