## Dotfiles

Let's enhance the experience of your machine by installing Le Wagon's pre-configured [dotfiles 🔗](https://github.com/lewagon/dotfiles). These are configuration files for your terminal, zsh, git, and VS Code.

### Forking the dotfiles

To customise this configuration for yourself, you'll need to **fork** the repository to your own Github account.

**Forking** creates a copy of the repository under your account (`your_github_username/dotfiles`), which you can then modify with your personal information, such as your name.

<details>
<summary>❗ <strong>If</strong> you already did another Le Wagon bootcamp  (<strong>Web Development, AI Software Development, Data Analytics, Data Science & AI</strong>, open this first ❗
</summary>

You may have an older version of the Le Wagon dotfiles. They could be incompatible with the current setup.


**Open a ticket** with a TA and do one of the following:
- Compare your existing dotfiles with the current Le Wagon [dotfiles 🔗](https://github.com/lewagon/dotfiles), particularly the `.zshrc`, `.zprofile`, and `settings.json` - if there is no meaningful difference other than your name and email setting, continue with the setup.
- If you are OK with losing your existing dotfiles (recommended):
    - Delete your existing dotfiles repository on GitHub and continue with the setup.
    - Delete the local repository: `rm -rf ~/code/<your_github_username>/dotifles`.
- If you do not want to lose your existing dotfiles, we recommend working with branches:
    - On your **laptop**, or wherever you have a **local** copy of **your existing version of dotfiles**
    - Create a branch of your existing dotfiles setup (`git checkout -b old-setup`), and push to GitHub - `git push origin old-setup`,
    - Go back to `master`: `git checkout master`.
    - On local `master`, `git pull upstream master`, resolve any conflicts, `git commit -m "merged"`, and `git push origin master`. It is important that you accept incoming changes to the `.zshrc`, `.zprofile`, and `settings.json` files.
    - Continue with the setup.

</details>

<br>

Run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

✔️ You should see your Github username printed.

❌ If not, stop here and ask for help. There may be a problem with the previous step (`gh auth`).

Time to fork the repo and clone it on your computer:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

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
