## Python Virtual Environment

Before we start installing relevant Python packages, we will isolate the setup for the Bootcamp into a **dedicated** virtual environment. We will use a `pyenv` plugin called [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv).

First let's install this plugin:

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

Once again, quit **all your opened terminal windows** (Cmd + Q) and restart one.

Let's create the virtual environment we are going to use during the whole bootcamp:

```bash
pyenv virtualenv <PYTHON_VERSION> lewagon
```

Let's now activate the virtual environment with:

```bash
pyenv activate lewagon
```

Great! Anytime we'll install Python package, we'll do it in that environment. In order for you to not have to always activate it everytime you open a new terminal, we conviniently added a line to the `~/.zshrc` file:

```bash
cat ~/.zshrc | grep activate
```

As the `~/.zshrc` is executed everytime you open a new terminal, it will automatically activate the `lewagon` virtualenv. Try it now, quit **all your opened terminal windows** (Cmd + Q) and restart one. Then run:

```bash
pyenv activate lewagon
```

It should tell you:

```bash
pyenv-virtualenv: version `lewagon' is already activated
```

All good!
