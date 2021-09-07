
# Keeping your setup current

This section contains the steps that you need to follow in order to make sure that your setup is up to date

First and foremost, in order to work in good conditions, make sure that :
- you are working with a high speed internet connection
- your computer has enough memory (8GB), so that you can run your code efficiently
- your computer has enough disk space (50GB), so that you can work on big datasets

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
git clone git@github.com:lewagon/data-certification-exam-test-delete-me
```

👉 Make sure that the command completes successfully

``` bash
rm -Rf data-certification-exam-test-delete-me
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
Start Docker :

``` bash
sudo service docker stop
```
$LINUX_END
$WINDOWS_START
Start Docker :

``` bash
sudo service docker stop
```

If this command does not work, restart Ubuntu by running the following command in a PowerShell window :

``` bash
wsl --shutdown
```

If the command still does not work, try to restart your Windows machine
$WINDOWS_END
