## Installing Python (with [`pyenv`](https://github.com/pyenv/pyenv))

### Uninstall `conda`

As we are using `pyenv` to install and manage our Python version, we need to uninstall [`conda`](https://docs.conda.io/projects/conda/en/latest/), another package manager you may have on your machine if you previously installed [Anaconda](https://www.anaconda.com/). Thus, we are preventing any possible Python version issue later.

Check if you have `conda` installed on your machine:

```bash
conda list
```
$MAC_START
If you have `zsh: command not found: conda`, you can **skip** the uninstall of `conda` and jump to the **Install pre-requisites** section.
$MAC_END
$LINUX_START
If you have `zsh: command not found: conda`, you can **skip** the uninstall of `conda` and jump to the **Install `pyenv`** section.
$LINUX_END
$WINDOWS_START
If you have `zsh: command not found: conda`, you can **skip** the uninstall of `conda` and jump to the **Install `pyenv`** section.
$WINDOWS_END

<details>
    <summary markdown='span'><code>conda</code> uninstall instructions</summary>

- Install the Anaconda-Clean package from your terminal and run the cleaning
```bash
conda install anaconda-clean
anaconda-clean --yes
```
- Remove every Anaconda directories
```bash
rm -rf ~/anaconda2
rm -rf ~/anaconda3
rm -rf ~/.anaconda_backup
$MAC_START
rm -rf ~/opt
$MAC_END
```
- Remove Anaconda path from your `.bash_profile`
    - Open the file with `code ~/.bash_profile`
    - If the file opens find the line matching the following pattern `export PATH="/path/to/anaconda3/bin:$PATH"` and delete the line
$MAC_START
    - Save the file with `CMD` + `s`
$MAC_END
$LINUX_START
    - Save the file with `CTRL` + `s`
$LINUX_END
- Restart your terminal with `exec zsh`
</details>
