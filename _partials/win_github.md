## Github

We need to generate SSH keys which are going to be used by Github
to authenticate you. Think of it as a way to log in, but different from the
well known username/password couple. If you already generated keys
that you already use with other services, you can skip this step.

Open a Windows Powershell terminal and copy-paste the lines below, replacing the email with **yours** (the
same one you used to create your GitHub account).

```bash
mkdir $HOME/.ssh # Ignore messages telling you it already exists. Go on
ssh-keygen -t ed25519 -o -a 100 -C "TYPE_YOUR_EMAIL@HERE.com"
```

It will prompt for information. Just press enter (to tell it to use the default values) until it asks for a **passphrase**.

**NB:** when asked for a passphrase, put something you want (and that you'll remember),
it's a password to protect your private key stored on your hard drive. You'll type,
nothing will show up on the screen, **that's normal**. Type the passphrase,
and when you're done, press `Enter`.

Then you need to give your **public** key to GitHub. Run:

```bash
cat $HOME/.ssh/id_ed25519.pub
```

It will prompt on the screen the content of the `id_ed25519.pub` file. Copy that text (`Ctrl` + `Shift` + `C`),
then go to [github.com/settings/ssh](https://github.com/settings/ssh). Click on
**Add SSH key**, fill in the Title with your computer name, and paste the **Key**.
Finish by clicking on the **Add key** green button.

To check that this step is completed, in the Git Bash terminal run this. You will be
prompted a warning, type `yes` then `Enter`.

```bash
ssh -T git@github.com
```

If you see something like this, you're done!

```bash
# Hi --------! You've successfully authenticated, but GitHub does not provide shell access
```

We need to set your `git` identity. In bash, type the following (**Don't blindly copy/paste it!**)

```bash
git config --global user.email "YOUR_GITHUB_EMAIL@HERE.COM"
git config --global user.name "YOUR NAME"
```

### SSH Agent

We want to use the OpenSSH Autentication Agent to remember our passphrase. First you
need to make sure that this Windows Service is set with a startup Type `Automatic`.

Click on the start menu and type "services", then `Enter`. Then look in the list for `OpenSSH Authentication Agent`.
On that line, right-click then `Properties`. In the startup type dropdown, choose `Automatic`.

Go back to the terminal and type:

```bash
ssh-add $HOME/.ssh/id_ed25519
```

It should prompt you for the passphrase. Type if (nothing is displayed, that's normal), then `Enter`.

In order for `git` to use this as well, we need to run this command:

```bash
git config --global core.sshCommand "'C:\Windows\System32\OpenSSH\ssh.exe'"
```

All good!
