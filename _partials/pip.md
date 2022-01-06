## Python packages

Now that we have a pristine `lewagon` virtual environment, it's time to install some packages in it.

First, let's upgrade `pip`, the tool to install Python Packages from [pypi.org](https://pypi.org). In the latest terminal where the virtualenv `lewagon` is activated, run:

```bash
pip install --upgrade pip
```

Then let's install some packages for the first weeks of the program:

$MAC_START
If your computer uses **Apple Silicon**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Apple Silicon 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_silicon.txt
```
</details>

If your computer uses **Apple Intel**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Apple Intel 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_intel.txt
```
</details>
$MAC_END
$WINDOWS_START
If your computer uses **Windows 11**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Windows 11 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/windows_11.txt
```
</details>

If your computer uses **Windows 10**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Windows 10 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/windows_10.txt
```
</details>
$WINDOWS_END
$LINUX_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
$LINUX_END
