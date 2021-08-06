## Python Virtual Environment

Before we start installing relevant Python packages, we will isolate the setup for the Bootcamp into a **dedicated** virtual environment. We will use the package manager [Conda](https://docs.conda.io/en/latest/).

First install [Miniforge](https://github.com/conda-forge/miniforge), a minimal installer for Conda specific to [conda-forge](https://conda-forge.org/) :

```bash
brew install miniforge
```

Initialize `conda` for shell interaction:
```bash
conda init zsh
```

<details>
    <summary>ℹ️ What happens above</summary>
The command above adds the following lines to your `~/.zshrc` config file:

```bash
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```
</details>
<br>

Create a Conda environment for the bootcamp (type ⏎ when asked for `Proceed ([y]/n)?`):
```bash
conda create --name lewagon
```

Activate the Conda environment every time you open the Terminal:
```bash
echo 'conda activate lewagon && PROMPT=$(echo $PROMPT | sed "s/($CONDA_DEFAULT_ENV) //") && RPROMPT+="[🐍 $CONDA_DEFAULT_ENV]"' >> ~/.zshrc
```

**Quit** and relaunch your Terminal, you should see:

![conda_env](images/conda_env.png)

Great! Anytime we'll install Python package, we'll do it in that environment.
