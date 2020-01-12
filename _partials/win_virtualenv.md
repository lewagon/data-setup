## Virtual Environment

Now we will install the `virtualenv` package:

```bash
pip install virtualenv
```

Let's create a new virtual environment for the whole bootcamp:

```bash
mkdir -p ~/.venvs && cd ~/.venvs
python -m venv lewagon
```

Awesome! The virtual environment has been created.

### Git Bash configuration

Launch a Git Bash window and type the following commands:

```bash
curl -Ls https://raw.githubusercontent.com/lewagon/data-setup/master/.bash_profile > ~/.bash_profile
mkdir -p ~/.config/git
curl -Ls https://raw.githubusercontent.com/lewagon/data-setup/master/git-prompt.sh > ~/.config/git/git-prompt.sh
```

Restart Git Bash. You should have the `lewagon` virtual environment activated (as shown on the left of your prompt)
