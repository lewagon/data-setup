
# Keeping your setup current

This section contains the steps that you need to follow in order to make sure that your setup is up to date

First and foremost, in order to work in good conditions, make sure that :
- you are working with a high speed internet connection
- your computer has enough memory (8GB), so that you can run your code efficiently
- your computer has enough disk space (30GB), so that you can work on big datasets

In this guide we focus on the essentials:

- Git and GitHub
- The `dotfiles`, the configuration files for your shell. These are important to get Python working.
- Installing Python and dependencies with `uv`.
- Authenticating with Google Cloud.

Depending on your use case you might also want to update other parts. If so, refer to the full setup instructions.




## git

Verify that git works

``` bash
git --version
```

👉 You should expect an output similar to this one yielding the git version :

``` bash
git version 2.33.0
```

If this doesn't work, we recommend you follow the full setup instructions.

## GitHub

Check that the `gh` CLI is authenticated:

✔️ If you get this you are all good 👍

```bash
✔️ Logged in to github.com as <YOUR GITHUB USERNAME>
- Active account: true
- Git operation protocol: ssh
...
```

Pay attention to `ssh` in the third line. If it says something else, your setup is no longer current.

❌ If not, we recommend you follow the full setup instructions.


## Updating your dotfiles

The dotfiles have gone through a major change in September 2026. If you installed them before, you need to update them.

Follow the instructions below for returning students.



## Dotfiles

Let's enhance the experience of your machine by installing Le Wagon's pre-configured [dotfiles 🔗](https://github.com/lewagon/dotfiles). These are configuration files for your terminal, zsh, git, and VS Code.


### Get your GitHub username

Run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

✔️ You should see your Github username printed.

❌ If not, stop here and ask for help. There may be a problem with the previous step (`gh auth`).


### Forking the dotfiles

To customise this configuration for yourself, you'll need to **fork** the repository to your own Github account.

**Forking** creates a copy of the repository under your account (`your_github_username/dotfiles`), which you can then modify with your personal information, such as your name.

<details>
<summary>❗ <strong>If you already did another Le Wagon bootcamp</strong> (<em>Web Development, AI Software Development, Data Analytics, Data Science & AI</em>, <strong>open a ticket with a TA</strong> and open this for instructions ❗
</summary>

You may have an older version of the Le Wagon dotfiles. They could be incompatible with the current setup.


**Together with a TA**, do one of the following:

<details>
<summary>I'm using <strong>the same machine</strong> (or a new machine which already has the dotfiles).</summary>

1. Move into your existing dotfiles folder:
   ```bash
   cd ~/code/$GITHUB_USERNAME/dotfiles
   ```

1. Check the diff against the current version of Le Wagon's dotfiles:
    ```bash
    git diff upstream/master
    ```

If there is no meaningful difference other than your name and email setting, continue with the setup.

</details>

<details>
<summary>I'm using <strong>a new machine</strong> without the dotfiles.</summary>

1. Browse to GitHub and find your `dotfiles` repository.

1. Check how many commits it's behind and ahead `lewagon/dotfiles:master`. You can see this just above the file list.

1. Click through to the behind and the ahead, and scroll down to see the diffs.

If there is no meaningful difference other than your name and email setting, continue with the setup.

</details>

<details>
<summary>The previous step revealed <strong>meaningful differences</strong>.</summary>

If you are OK with losing your existing dotfiles (recommended):

Be aware that this will remove any personal changes you made to your shell configuration, like loading extra utilites, or changing the look and feel of your shell. If you're not aware of any changes you made yourself, this should be fine.

1. Delete your existing dotfiles repository on GitHub.
1. Delete the local repository:
    ```bash
    cd ~/code && rm -rf ~/code/$GITHUB_USERNAME/dotfiles
    ```
1. Continue with the setup.

<details>
<summary>If you do not want to lose your existing dotfiles, we recommend working with branches. Click to open.</summary>

On your **laptop**, or wherever you have a **local** copy of **your existing version of dotfiles**.

1. Commit your current version of your dotfiles:

    ```bash
    git add .
    git status # Check what will be committed
    git commit -m "Version prior to new setup"
    ```

1. Create a branch of your current dotfiles setup, and push to GitHub:
    
    ```bash
    git checkout -b old-setup
    git push origin old-setup
    ```

1. Go back to `master`: `git checkout master`.

1. On local `master`, `git pull upstream master`.

1. Check that you're not in `MERGING` state. If you are, resolve any conflicts.
    
    It is important that you accept incoming changes to the `.zshrc`, `.zprofile`, and `settings.json` files. Especially anything related to `pyenv` and to Python environments.

    If there are too many conficts, use your code editor to replace the contents of the conflicting files with the ones from [the Le Wagon dotfiles](https://www.github.com/lewagon/dotfiles).

    Commit your conflict resolution: `git commit --no-edit`

1. Push your changes to GitHub: `git push origin master`.

1. Continue with the setup.

</details>

</details>

</details>

<br>

Time to fork the repo and clone it on your computer:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

If you're asked _"Are you sure you want to continue connecting (yes/no/[fingerprint])?"_, type `yes` followed by `Enter`.

### Installing the dotfiles

Run the `dotfiles` installer with:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Check the emails registered with your GitHub Account. You'll need to pick one in the next step:

```bash
gh api user/emails | jq -r '.[].email'
```

Run the git installer:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: This will **prompt** you for your name (`FirstName LastName`) and your email.

:warning: You **need** to put one of the emails listed above from the previous `gh api ...` command. If you don't do that, Kitt will not be able to track your progress.

💡 Select the `...@users.noreply.github.com` address if you don't want your email to appear in public repositories you may contribute to.


## Install Python and dependencies

Your operating system - macOS, or Ubuntu (native, or inside WSL) - comes with a "system Python". That's a Python version your system depends on. We don't mess around with that one. We're going to do a professional setup of Python where you don't mess up your "system Python" and where you'll be able to switch which version you want to use for each project you work on.

To manage different Python versions and virtual environments (you'll discover what that means during the setup lecture), we will use the state-of-the-art [`uv` created by Astral](https://docs.astral.sh/uv/).


### Install `uv`

First, we'll install `uv`:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Next, restart your shell by running this:

```bash
exec zsh
```

### Create a virtual environment

Next, we'll create a virtual environment (an isolated environment with Python and the dependencies for the bootcamp):

```bash
uv venv ~/.lewagon/venvs/lewagon --python 3.12.9
```

Now that we created this new virtual environment, let's restart our shell to pick it up (this works thanks to the `lewagon/dotfiles` we installed before):

```bash
exec zsh
```

Let's check that everything went right. Run this:

```bash
which python3
```

It should return this:


``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```


If it doesn't, check with a TA! Do not continue with the next step before you solved this!


### Install dependencies

Python is great for data, because the community has developed an enormous amount of packages we can re-use.

Let's install the most common ones:


``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```



## Jupyter Notebook tweaking

Depending on your system, we need to make some small changes to your Jupyter configuration.

Run this:

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/checks/setup_jupyter.sh)"
```

<details>
<summary>If you are curious about what happens here, click here.</summary>

This script adds a configuration to improve the display of the [`details` disclosure elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) in your notebooks.

If you're using Windows WSL, it also fixes some other problems.

- It makes sure your browser is configured correctly. It was configured before, but was overwritten by the dotfiles setup.
- It fixes a known bug with Jupyter Notebook always opening the directory tree, even if you specify a specific file path.


</details>


## Python setup check

Let's run some checks. If any of the following steps fail, ask a TA for help.

Let's reset your terminal:

```bash
cd ~/code && exec zsh
```

Make sure you can run Jupyter:

```bash
jupyter notebook
```

Your web browser should open on a `jupyter` window.

<details>

  <summary>Note if you're running the setup on a virtual machine</summary>

  VSCode detects that a jupyter notebook started in your virtual machine and creates a port forward in order to allow you to open the application in your browser.

  Hit Open in Browser or go to http://localhost:8888/ (the url to use is available in the terminal).

  ![](images/jupyter_port_forward.png)

  On the first run, jupyter will ask for the token displayed in the terminal of your virtual machine in order to allow you to connect to the application from your local machine.

  Fill the token and hit Log in.

  ![](images/jupyter_token.png)

  You are now interacting from your local machine with the jupyter application running in your virtual machine.
</details>


![jupyter.png](images/jupyter.png)

Click on `New` and in the dropdown menu select `Python 3 (ipykernel)`:

![jupyter_new.png](images/jupyter_new.png)

A tab should open on a new notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

Make sure that you are running the correct python version in the notebook. Open a cell and run:

``` python
import sys; sys.version
```

It should output `3.12.9` followed by some more details. If not, check with a TA.

In another cell, run:

```python
import pandas as pd
pd.__version__
```

This might take a few minutes to run. It should output a version number, `2.2.3`.  If not, check with a TA.

You can close your web browser then terminate the jupyter server with `CTRL` + `C`.

Here you have it! A complete python virtual env with all the third-party packages you'll need for the whole bootcamp.



## Google Cloud CLI

### Install `gcloud`

Install the `gcloud` CLI to communicate with [Google Cloud Platform](https://cloud.google.com/) through your terminal:
```bash
sudo apt-get update && sudo apt-get install ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
```
👉 [Install documentation](https://cloud.google.com/sdk/docs/install#deb)


### Configure the Google Cloud CLI

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

- Now let's set up Application Default Credentials so your Python code can access GCP:

  ```bash
  gcloud auth application-default login
  ```

  This will open a browser window. Log in with the same Google account you used to create your GCP project. Your credentials will be saved automatically.

- Let's verify your Application Default Credentials are working:

  ```bash
  gcloud auth application-default print-access-token
  ```

  You should see a long token string. If you see an error, run `gcloud auth application-default login` again.

  <details>
    <summary>Troubleshooting</summary>

  - `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`
    - Make sure that billing is enabled for your Google Cloud Platform project [https://cloud.google.com/billing/docs/how-to/modify-project](https://cloud.google.com/billing/docs/how-to/modify-project)
  </details>

🏁 You are done with the GCP setup!


