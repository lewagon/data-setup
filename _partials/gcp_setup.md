## Google Cloud Platform setup

[GCP](https://cloud.google.com/) is a cloud solution that you are going to use in order to deploy your Machine Learning-based products to production.

### Project setup

> 🚨  **Skip this part if you are working on a project someone created for you**

- Go to [Google Cloud](https://console.cloud.google.com/) and create an account if you do not already have one
- In the Cloud Console, on the project list, select or create a Cloud project

![](images/gcp-create-project.png)

- Give it a name such as `Wagon Bootcamp` for example
- Notice the `ID` automatically created for the project, e.g. `wagon-bootcamp-123456`

![](images/gcp_project.png)

### Account language

In order to facilitate the following of the instructions during the bootcamp, open your GCP account preferences:

https://myaccount.google.com/language

If the *preferred language* is not:
- **English**
- **United States**

Then switch the language to english:
- Click on the edit pen logo
- Select **English**
- Select **United States**
- Click on **Select**

### Billing account

> 🚨  **Skip this part if you are working on a project someone created for you**

You will now link your account to your credit card. This step is required or you will not be able to use the services provided by GCP. Do not worry, you will be able to consume most GCP services through free credits throughout the bootcamp.

![](images/gcp-billing.png)

- Click on **Billing**
- Click on **MANAGE BILLING ACCOUNTS**
- Click on **ADD BILLING ACCOUNT**
- Give a name to your billing account, e.g. `My Billing Account`
- Click on "I have read..." and agree the to the terms of service
- Click on **CONTINUE**
- Select your account type: `Individual`
- Fill your name and address

You should see that you have a free credit of "$300 credits over the next 90days".

- Click on card details
- Enter your credit card info
- Click on **START MY FREE TRIAL**

Once this is done, verify that your billing account is linked to your GCP project.

- Select your project
- Go to **Billing**
- Select **LINK A BILLING ACCOUNT**
- Select `My Billing Account`
- Click on **SET ACCOUNT**

You should now see:

```
Free trial status: $300 credit and 91 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.
```

<details>
  <summary>👉 If you do not own a credit card 👈</summary>


If you do not own a credit card, an alternative is to setup a **Revolut** account.
Revolut is a financial app that will allow you to create a virtual credit card linked to your mobile phone billing account.

Skip this step if you own a credit card and use your credit card for the setup.

Download the Revolut app, or go to [revolut](https://www.revolut.com/a-radically-better-account) and follow the steps to download the app (enter your mobile phone number and click on Get Started).

- Open the Revolut app
- Enter your mobile phone number
- Enter the verification code received by SMS
- The app will ask for your country, address, first and last name, date of birth, email address
- The app will also ask for a selfie and request your profession
- The app will require a photo of your identification card or passport

Once this is done, select the standard (free) plan. No need to add the card to Apple pay, or ask for a the delivery of a physical card, or add money securely.

You now have a virtual card which we will use for the GCP setup.

In the main view of the Revolut the app
- Click on Ready to use
- Click on the card
- Click on Show card details
- Note down the references of the virtual credit card and use them in order to proceed with the GCP setup

</details>

<details>
  <summary>👉 If you receive an email from Google saying "Urgent: your billing account XXXXXX-XXXXXX-XXXXXX has been suspended" 👈</summary>


This may happen especially in case you just setup a Revolut account.

- Click on PROCEED TO VERIFICATION
- You will be asked to send a picture of your credit card (only the last 4 digits, no other info)
- In case you used **Revolut**, you can send a screenshot of your virtual credit card (do not forget to remove the validity date from the screenshot)
- Explain that you are attending the Le Wagon bootcamp, do not own a credit card, and have just created a Revolut account in order to setup GCP for the bootcamp using a virtual credit card

You may receive a validation or requests for more information within 30 minutes.

Once the verification goes through, you should receive an email stating that "Your Google Cloud Platform billing account XXXXXX-XXXXXX-XXXXXX has been fully reinstated and is ready to use.".

</details>

### Enabling GCP services

> 🚨  **Skip this part if you are working on a project someone created for you**

- Make sure that billing is enabled for your Google Cloud project

ℹ️ You have a **$300 credit** to use for Google Cloud resources, which will be more than enough for the bootcamp.

- [Enable the BigQuery and Compute Engine APIs](https://console.cloud.google.com/flows/enableapi?apiid=bigquery,compute) (This step may take a few minutes)

### Configure Cloud sdk

- Authenticate the `gcloud` CLI with the google account you used for GCP

$MAC_START
```bash
gcloud auth login
```
$MAC_END
$LINUX_START
```bash
gcloud auth login
```
$LINUX_END
$WINDOWS_START
```bash
gcloud auth login --no-launch-browser
```
$WINDOWS_END

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
  <summary>🤔 Why do we need a service account key ?</summary>


  You have created a `GCP account` linked to your credit card. Your account will be billed according to your usage of the resources of the **Google Cloud Platform**. The billing will occur if you consume anything once the free trial is over, or if you exceed the amount of spending allowed during the free trial.

  In your `GCP account`, you have created a single `GCP project`, identified by its `PROJECT_ID`. The `GCP projects` allow you to organize and monitor more precisely how you consume the **GCP** resources. For the purpose of the bootcamp, we are only going to create a single project.

  Now, we need a way to tell which resources within a `GCP project` our code will be allowed to consume. Our code consumes GCP resources through API calls.

  Since API calls are not free, it is important to define with caution how our code will be allowed to use them. During the bootcamp this will not be an issue and we are going to allow our code to use all the API of **GCP** without any restrictions.

  In the same way that there may be several projects associated with a GCP account, a project may be composed of several services (any bundle of code, whatever its form factor, that requires the usage of GCP API calls in order to fulfill its purpose).

  GCP requires that the services of the projects using API calls are registered on the platform and their credentials configured through the access granted to a `service account`.

  For the moment we will only need to use a single service and will create the corresponding `service account`.
</details>

Since the [service account](https://cloud.google.com/iam/docs/service-accounts) is what identifies your application (and therefore your GCP billing account and ultimately your credit card), you are going to want to be cautious with the next steps.

⚠️ **Do not share you service account json file 🔑** ⚠️ Do not store it on your desktop, do not store it in your git codebase (even if your git repository is private), do not let it by the coffee machine, do not send it as a tweet.

#### Go to the Service Accounts page

Navigate to the GCP service accounts page at [this link](https://console.cloud.google.com/apis/credentials/serviceaccountkey).

- Select your project in the list of recent projects if asked to.
- If not asked, make sure the right project is selected in the Project selecter list at the top of the page.

An alternate way to navigate to the Service Accounts page is from the following:

<img width="400" alt="01 Go to Service Accounts" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-01.png">

#### Create a service account

- Click on **CREATE SERVICE ACCOUNT**.

  <img width="400" alt="02 Create Service Account" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-02.png">

- Give your service account a name, an id and a description, and click on **CREATE AND CONTINUE**.

  <img width="400" alt="03 Name the service account" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-03.png">

- Click on **Select a role** and choose `Basic` then **`Owner`**, which gives the service account full access to all resources of your GCP project.

  <img width="400" alt="04 Add BigQuery Job User" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-04.png">

- Click on the blue **DONE** button at the bottom of this window. We don't need to worry about the section *Grant your users access to this service account*.

  <img width="400" alt="04 Done" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-05.png">


#### Create a json key 🔑 for this service account

- On the service accounts page, click on the email address of the newly created service account.

  <img width="400" alt="05 Select the service account" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-06.png">

- Click on the **KEYS** tab at the top of the page.

  <img width="400" alt="06 Go to Keys" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-07.png">


- Click on **ADD KEY** then **Create new key**.

  <img width="400" alt="07 Add Key" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-08.png">


- Select **JSON** and click on **CREATE**.

  <img width="400" alt="08 Choose JSON and Create" src="https://wagon-public-datasets.s3.amazonaws.com/data-science-images/00-Setup/GCP/service-account-09.png">

- The browser has now saved the service account json file 🔑 in your downloads directory (it is named according to your service account name, something like `le-wagon-data-123456789abc.json`).
