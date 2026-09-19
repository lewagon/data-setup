## Install Python and dependencies

Your operating system - macOS, or Ubuntu (native, or inside WSL) - comes with a "system Python". That's a Python version your system depends on. We don't mess around with that one. We're going to do a professional setup of Python where you don't mess up your "system Python" and wher you'll be able to switch which version you want to use for each project you work on.

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

{% if os == "macos" %}
``` bash
/Users/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% elsif os == "windows" %}
``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% elsif os == "linux" %}
``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% endif %}

If it doesn't, check with a TA! Do not continue with the next step before you solved this!


### Install dependencies

Python is great for data, because the communitiy has developed an enormous amount of packages we can re-use.

Let's install the most common ones:

{% if os == "macos" %}
``` bash
uv pip install -r {{ SPECS_LOCATION }}/apple_silicon.txt
```
{% elsif os == "windows" %}
``` bash
uv pip install -r {{ SPECS_LOCATION }}/linux.txt
```
{% elsif os == "linux" %}
``` bash
uv pip install -r {{ SPECS_LOCATION }}/linux.txt
```
{% endif %}
