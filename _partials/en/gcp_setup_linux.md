- Store the service account json file somewhere you'll remember, for example:

``` bash
/home/LINUX_USERNAME/code/GITHUB_NICKNAME/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json
```

- Store the **absolute path** to the `JSON` file as an environment variable:

``` bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/path/to/the/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.zshrc
```
**Note:** every time you run this command, it will add this line to your zshrc file regardless of whether you already have it. If you made a mistake and need to fix it, preferably open the file and edit the line!

You can do so by running

```bash
code ~/.zshrc
```

in the Terminal! 😄
