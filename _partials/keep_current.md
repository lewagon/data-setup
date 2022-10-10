
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

👉 You should expect an output similar to this one yielding the git version :

``` bash
git version 2.33.0
```

## GitHub

Verify that you have access to the Le Wagon public GitHub repositories

``` bash
cd ~/code/<YOUR_GITHUB_NICKNAME>/
git clone git@github.com:lewagon/data-setup data-setup
```

👉 The repo should clone correctly :

``` bash
Cloning into 'data-setup'...
remote: Enumerating objects: 21, done.
remote: Counting objects: 100% (21/21), done.
remote: Compressing objects: 100% (14/14), done.
Receiving objects: 100% (21/21), done.
Resolving deltas: 100% (6/6), done.
remote: Total 21 (delta 6), reused 16 (delta 1), pack-reused 0
```

👉 You can delete the cloned repo

``` bash
rm -Rf data-setup
```

## Verify your pyenv configuration

Verify that you have a `~/.zprofile` :

``` bash
cat ~/.zprofile
```

👉 You should see the following lines :

``` bash
# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
type -a pyenv > /dev/null && eval "$(pyenv init --path)"
```

If the command does not output anything, create the `~/.zprofile` file :

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

$MAC_START
``` bash
brew update && brew upgrade pyenv
```
$MAC_END
$LINUX_START
``` bash
cd $(pyenv root) && git pull
```
$LINUX_END
$WINDOWS_START
``` bash
cd $(pyenv root) && git pull
```
$WINDOWS_END

Install the current python version :

```bash
pyenv install <PYTHON_VERSION>
```

👉 Make sure that the command completes correctly and **restart your terminal**

Let's remove the existing current virtual environment :

```bash
pyenv virtualenv-delete lewagon_current
```

Create a new virtual environment :

```bash
pyenv virtualenv <PYTHON_VERSION> lewagon_current
```

Set the new virtual environment as default :

```bash
pyenv global lewagon_current
```

You should now be able to see the new virtual environment as active :

``` bash
pyenv versions
```

👉 Here is a sample output :

``` bash
  system
  <PYTHON_VERSION>
  <PYTHON_VERSION>/envs/lewagon_current
  3.7.6
  3.7.6/envs/lewagon
* lewagon_current
  lewagon
```

### Install the bootcamp packages

```bash
pip install -U pip
```

$MAC_START
If your computer uses **Apple Silicon**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Apple Silicon 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_silicon.txt
```
</details>

If your computer uses **Apple Intel**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Apple Intel 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_intel.txt
```
</details>
$MAC_END
$WINDOWS_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
$WINDOWS_END
$LINUX_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
$LINUX_END

## GCP

Make sure that the `gcloud` command is linked to the email address of your Google Cloud Platform account :

``` bash
gcloud auth list
```

👉 This lists the email address of your GCP account :

``` bash
      Credentialed Accounts
ACTIVE  ACCOUNT
*       your.email_address@your.email.provider

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

Verify the name of your gcp project :

``` bash
gcloud config list
```

👉 This lists both the email address of your GCP account and your GCP project :


``` bash
[core]
account = your.email_address@your.email.provider
disable_usage_reporting = True
project = your-gcp-project-id

Your active configuration is: [default]
```

Verify the email created for the service account allowing your code to identify to GCP :

``` bash
gcloud iam service-accounts list
```

👉 This lists the GCP email address of the service account that allows your code to identify to GCP

``` bash
DISPLAY NAME          EMAIL                                                              DISABLED
your-gcp-project-id   your-service-account@your-service-account.iam.gserviceaccount.com  False
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

👉 This lists the content of your service account credentials json key :

``` bash
{
  "type": "service_account",
  "project_id": "your-gcp-project-id",
  "private_key_id": "a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInM=\n-----END PRIVATE KEY-----\n",
  "client_email": "your-service-account@your-service-account.iam.gserviceaccount.com",
  "client_id": "105410541054105410541",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-service-account.iam.gserviceaccount.com"
}
```

Make sure that the file contains the correct :
- project id : your-gcp-project-id
- service account email address : your-service-account@your-service-account.iam.gserviceaccount.com

👉 If this does not display anything or if the email inside of the file is not the one of your service account, go back to the setup

Make sure that Docker recognizes the GCP ressources :

``` bash
gcloud auth configure-docker
```

👉 This lists the image name prefixes recognized by Docker as targetted to GCP

``` bash
{
  "credHelpers": {
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud",
    "marketplace.gcr.io": "gcloud",
    "gcr.io": "gcloud"
  }
}
```

## Docker

$MAC_START
Start the Docker app
$MAC_END
$LINUX_START
Start Docker :

``` bash
sudo service docker start
```
$LINUX_END
$WINDOWS_START
Start Docker :

``` bash
sudo service docker start
```
$WINDOWS_END

Verify that Docker can run the hello-world image :

``` bash
docker run hello-world
```

👉 Make sure that this command completes correctly

$MAC_START
Stop the Docker app
$MAC_END
$LINUX_START
Stop Docker :

``` bash
sudo service docker stop
```
$LINUX_END
$WINDOWS_START
Stop Docker :

``` bash
sudo service docker stop
```

If this command does not work, restart Ubuntu by running the following command in a PowerShell window :

``` bash
wsl --shutdown
```

If the command still does not work, try to restart your Windows machine
$WINDOWS_END
