We will now move the service account json file from your Windows disk to the Ubuntu disk. This will allow the development tools in Ubuntu to access to the ressources of your GCP account.

First, let's create a directory in which we will store the file.

👉 Open an Ubuntu terminal and run the following commands

🚨 replace `GITHUB_NICKNAME` by your **GitHub** nickname

``` bash
cd ~/code/GITHUB_NICKNAME
ls -la
```

If the command does not show the `dotfiles` directory, ask for a TA 🙏

Otherwise, you can proceed with the setup:

``` bash
mkdir gcp
```

![](images/wsl-gcp-dir.png)

We will now move the service account json file to the `gcp` directory we just created.

Open a Windows **File Explorer** (Win + E) and locate the `gcp` directory in the Ubuntu file system.

You can either:
- Use the **Quick access** link that we created earlier
- manually type the location of the `gcp` directory in the Ubuntu file system in the address bar:

```
\\wsl$\Ubuntu\home\UBUNTU_USERNAME\code\GITHUB_NICKNAME
```


🚨 if you opt for the second option:
- replace `UBUNTU_USERNAME` by the username that you choose during the **Ubuntu** setup
- replace `GITHUB_NICKNAME` by your **GitHub** nickname

![](images/wsl-gcp-key.png)

Once you have located the `gcp` directory in the Windows **File Explorer**, move the service account json file that you downloaded inside of it.

The file should now be visible from Ubuntu file system.

👉 Open an Ubuntu terminal and verify that the service account json file has been moved

``` bash
cd gcp
ls -la
```

![](images/wsl-gcp-dir-2.png)

If you do not see the service account json file listed in the `gcp` directory, ask for a TA 🙏

We will now store the path to your service account json file in an environment variable.

🚨 in the following command, replace:
- `UBUNTU_USERNAME` by the username that you choose during the **Ubuntu** setup
- `GITHUB_NICKNAME` by your **GitHub** nickname
- `SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json` by the name of your service account json file

``` bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/home/UBUNTU_USERNAME/code/GITHUB_NICKNAME/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.aliases
```
