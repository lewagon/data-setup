
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

{% if os == "macos" %}
:warning: Note that the current setup no longer supports Apple computers equipped with Intel processors. 

Refer to the full setup instructions if you are not sure about your processor.
{% endif %}


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

