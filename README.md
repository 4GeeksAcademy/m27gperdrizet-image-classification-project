# Image classification environment set-up

The machine learning project template repository provided via the project tutorial on 4Geeks is not sufficient to complete this project. Take a look for yourself, the reading materials and provided solution use Google's TensorFlow - which is not included in the `requirements.txt`. Using this fork of the repo will get you up and running in a codespace in just a few minutes.

## 1. Get a Kaggle account

The dataset is hosted on Kaggle. To download it you need a free account. It's easy to set up via the link below, all you need is an email address:

[Login or Register | Kaggle](https://www.kaggle.com/account/login?phase=startRegisterTab)

Once you are registered and logged in:

- Go to the [Dogs vs Cats competition](https://www.kaggle.com/competitions/dogs-vs-cats) page
- Go to the 'Data' tab
- Scroll down and click 'Join competition'

Now, you need to generate and save an API access token so that you can download the dataset from within a codespace:

- From the homepage, click on your profile in the upper left
- Select 'Settings'
- Scroll down, under API, click 'Create New Token'
- Click 'Continue'
- Save the key file on you local machine

The contents of the file should look like this:

```json
{"username":"your-user-name","key":"a-bunch-of-letters-and-numbers"}
```

## 2. Start a codespace

Training neural networks requires significant computational power. I have requested access to 8-core machines from 4Geeks for this project. Hopefully, this request will be approved by the time you are reading this. If not, we will have to stick with the usual dual-core machines. The project will still work, but training the image classifier will take much longer.

From this repository:

- Click the 'Code' dropdown
- Select the 'Codespaces' tab
- Click the three dot menu at the top left of the Codespaces dropdown
- Select 'New with options'
- Change 'Machine type' to '8-core' or '16-core' if avalible, if not, leave '2-core' selected
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

## 4. Download and prepare the data

From you codespace terminal run the following command:

```bash
./get_data.sh
```

The script downloads the data from Kaggle, decompresses it and moves the training cats and dogs into separate directories.

Easy! Now we can work with the data in a Jupyter notebook. Open `src/mvp.ipynb` to get started.
