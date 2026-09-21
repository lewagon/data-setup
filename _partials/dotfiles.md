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
