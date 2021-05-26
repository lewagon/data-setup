- Store the service account json file somewhere you'll remember, for example `/Users/YOUR_USER_NAME/Documents/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json`
- Store the **absolute path** to the `JSON` file as an environment variable:

```bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/path/to/the/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.aliases
```
