
# Keeping your setup current

This section contains the steps that you need to follow in order to make sure that your setup is up to date

First and foremost, in order to work in good conditions, make sure that :
- you are working with a high speed internet connection
- your computer has enough memory (8GB), so that you can run your code efficiently
- your computer has enough disk space (30GB), so that you can work on big datasets

## git

Verify that git works

``` bash
git --version
```

👉 should yield your git version, like 2.33.0

## GitHub

Verify that GitHub works and that you have access to the Le Wagon repositories

``` bash
cd ~/code/<YOUR_GITHUB_NICKNAME>/
git clone git@github.com:lewagon/data-certification-exam data-certification-exam-test-delete-me
```

👉 Make sure that the command completes successfully

``` bash
rm -Rf data-certification-exam-test-delete-me
```

## Verify your pyenv configuration

Verify that you have a `~/.zprofile` :

``` bash
cat ~/.zprofile
```

👉 If the command does not output anything, create one :

``` bash
cd
touch .zprofile
```

Add the following lines to your `~/.zprofile` :

``` bash
# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
type -a pyenv > /dev/null && eval "$(pyenv init --path)"
```

## Create a dedicated virtual environment

Update pyenv :

``` bash
cd $(pyenv root) && git pull
```

Install the current python version :

```bash
pyenv install 3.8.12
```

Let's make sure no virtual environment with the same name exists :

```bash
pyenv virtualenv-delete lewagon_current
```

Create a new virtual environment :

```bash
pyenv virtualenv 3.8.12 lewagon_current
```

Set the new virtual environment as default :

```bash
pyenv global lewagon_current
```

## GCP

Make sure that the `gcloud` command is linked to the email address of your Google Cloud Platform account :

``` bash
gcloud auth list
```

Verify the name of your gcp project :

``` bash
gcloud config list
```

Verify the email created for the service account allowing your code to identify to GCP :

``` bash
gcloud iam service-accounts list
```

Go to [GCP IAM & Admin / Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts):
- Select your project
- Click on the service account email
- Go to `PERMISSIONS`
- Make sure that the service account email has a `Role` set to `Owner`

Verify that you have configured your machine to allow your code to identify to GCP. The service account credentials json key file should be linked to the correct service account email :

``` bash
cat $GOOGLE_APPLICATION_CREDENTIALS
```

👉 If this does not display anything or if the email inside of the file is not the one of your service account, go back to the setup

Make sure that Docker recognizes the GCP ressources :

``` bash
gcloud auth configure-docker
```

## Docker

Start Docker :

``` bash
sudo service docker start
```

Verify that Docker can run the hello-world image :

``` bash
docker run hello-world
```

👉 Make sure that this command completes correctly

Start Docker :

``` bash
sudo service docker stop
```


### Python setup check up

Check your Python version with the following commands:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh)" 3.8.12
```

Run the following command to check if you successfully installed the required packages:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh)"
```

Now run the following command to check if you can load these packages:
```bash
python -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py)"
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.


