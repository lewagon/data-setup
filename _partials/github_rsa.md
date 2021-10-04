## GitHub

### Already configured?

Then try this command:

```bash
ssh -T git@github.com
```

If it returns the following:

```bash
# Hi <your_github_nickname>! You've successfully authenticated, but GitHub does not provide shell access
```

It means `git` is **already** configured on your laptop, you can skip the section below!

### Configuring your first SSH key

We need to generate SSH keys which are going to be used by GitHub and Heroku
to authenticate you. Think of it as a way to log in, but different from the
well known username/password couple. If you already generated keys
that you already use with other services, you can skip this step.

Open a terminal and type this, replacing the email with **yours** (the
same one you used to create your GitHub account). It will prompt
for information. Just press enter until it asks for a **passphrase**.

```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
```

**NB:** when asked for a passphrase, put something you want (and that you'll remember),
it's a password to protect your private key stored on your hard drive. You'll type,
nothing will show up on the screen, **that's normal**. Just type the passphrase,
and when you're done, press `Enter`.

### Giving your public key to GitHub

Now, you will give your **public** key to GitHub.

In your terminal copy-paste the following command:

```bash
gh auth refresh -s write:public_key
```

It will prompt a one time code (####-####) on the screen. Copy it and press `ENTER`, then paste the code in your browser and follow the instructions to **Authorize GitHub**.

Back in the terminal, press `ENTER` and run this:

```bash
gh ssh-key add ~/.ssh/id_ed25519.pub
```

This should return `✓ Public key added to your account`. If not, do not hesitate to **contact a teacher**.

Don't be in a rush, take time to [read this StackOverflow Q&A](https://stackoverflow.com/questions/28479567/why-does-github-only-need-my-public-key-in-order-to-push) to get a better
understanding of what those keys are used for.
