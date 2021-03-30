## Google Cloud Platform setup

[GCP](https://cloud.google.com/) is a cloud solution you are going to use in order to deploy your Machine Learning-based product in production.

### Project setup
- Go to [Google Cloud](https://console.cloud.google.com/) and create an account if you do not already have one
- In the Cloud Console, on the project list, select or create a Cloud project
- Give it a name such as `Wagon Bootcamp` for example
- Notice the `ID` automatically created for the project, e.g. `wagon-bootcamp-123456`

![](images/gcp_project.png)

- Make sure that billing is enabled for your Google Cloud project

ℹ️ You have a **$300 credit** to use for Google Cloud resources, which will be more than enough for the bootcamp.

- [Enable the AI Platform Training & Prediction and Compute Engine APIs](https://console.cloud.google.com/flows/enableapi?apiid=ml.googleapis.com,compute_component&_ga=2.269215094.662509797.1580849510-2071889129.1567861089&_gac=1.154971594.1580849512.CjwKCAiAyeTxBRBvEiwAuM8dnbZ6uMwizbZW44J2mBCX6ncEjwjwpgF8S8QsvhYAXLkJ8awDnIRTNRoCJ_0QAvD_BwE) (This step may take a few minutes)

### Configure Cloud sdk
- Authenticate the `gcloud` CLI with the google account you used for GCP
```bash
gcloud auth login
```
- Login to your Google account on the new tab opened in your web browser
- List your active account and check your email address you used for GCP is present
```bash
gcloud auth list
```
- Set your current project (replace `PROJECT_ID` with the `ID` of your project, e.g. `wagon-bootcamp-123456`)
```bash
gcloud config set project PROJECT_ID
```
- List your active account and current project and check your project is present
```bash
gcloud config list
```

### Create a service account key 🔑

Now that you have created a `GCP account` and a `project` (identified by its `PROJECT_ID`), we are going to configure the actions (API calls) that you want to allow your code to perform.

<details>
  <summary>TL;DR</summary>
  Since API calls are not free, it may be important to define these with caution, but for the purpose of the bootcamp this will not be an issue and we are going to allow our code to use all API without any restrictions (see the project owner part later).

  As there may be several projects associated with a GCP account, a project may be composed of several services (any bundle of code, whatever its form factor, that requires the usage of GCP API calls in order to fulfill its purpose).

  GCP requires that the services of the project using API calls are registered on the platform and their credentials configured.

  Here we will only need to use a single service and will create the corresponding `service account`.

  Since the [service account](https://cloud.google.com/iam/docs/service-accounts) is what identifies your application (and therefore your GCP billing account and ultimately your credit card) when it comes to bill the performed API calls, you are going to want to be cautious with the next steps. Basically, do not let your service account json file by the coffee machine, do not send it as a tweet, do not store it in your git codebase (even if your git repository is private).
</details>

- Go to [Service Account key page](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
- Create a new Service Account key :
  - Give a name to that account
  - Set Role as `project > owner`
- Download the `JSON` file, and store it somewhere you'll remember, for example `/Users/YOUR_USER_NAME/Documents/gcp_keys/YOUR_FILENAME_FOR_SECRET_KEY.json`
- Give it a name **without** any space
- Store the ****absolute access path** to the `JSON` file as an environmental variable:
```bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/path/to/the/credentials.json' >> ~/.aliases
```
<details>
  <summary>ℹ️ How to find the absolute access path of a file?</summary>
  You can drag and drop the file in your terminal.
</details>

- **Restart** your terminal and run:
```bash
echo $GOOGLE_APPLICATION_CREDENTIALS
```
expected ouptut:
```bash
/Users/YOUR_USER_NAME/Documents/gcp_keys/YOUR_FILENAME_FOR_SECRET_KEY.json
```

- List the service accounts associated to your active account and current project
```bash
gcloud iam service-accounts list
```
- Retrieve the service account email address, e.g. `SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com`
- List the roles of the service account from the cli (replace PROJECT_ID and SERVICE_ACCOUNT_EMAIL)
```bash
gcloud projects get-iam-policy PROJECT_ID \
--flatten="bindings[].members" \
--format='table(bindings.role)' \
--filter="bindings.members:SERVICE_ACCOUNT_EMAIL"
```
- You should see that your service account has a role of `roles/owner`

<details>
  <summary>Troubleshooting</summary>

- I don't have any credit card
  - The neo-bank Revolut offers a free credit card with its [Standard plan](https://www.revolut.com/a-radically-better-account)


- `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`
  - Make sure that billing is enabled for your Google Cloud Platform project https://cloud.google.com/billing/docs/how-to/modify-project
</details>

🏁 You are done for today!
