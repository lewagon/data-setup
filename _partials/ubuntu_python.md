## Installing Python (with [`pyenv`](https://github.com/pyenv/pyenv))

macOS comes with an outdated version of Python that we don't want to use. You might already have installed Anaconda or something else to tinker with Python and Data Science packages. All of this does not really matter as we are going to do a professional setup of Python where you'll be able to switch which version you want to use whenever you type `python` in the terminal.

First let's install `pyenv` with the following Terminal command:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Then quit **all your opened terminal windows** (Cmd + Q) and restart one. Ignore the `pyenv: no such command 'virtualenv-init' for now`.

Let's install some [dependencies](https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites) needed to build Python from `pyenv`:

```bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl
```

Let's install the [latest stable version of Python](https://www.python.org/doc/versions/) supported by Le Wagon's curriculum:

```bash
pyenv install <PYTHON_VERSION>
```

This command might take a while, this is perfectly normal. Don't hesitate to help other students seated next to you!

OK once this command is complete, we are going to tell the system to use this version of Python **by default**. This is done with:

```bash
pyenv global <PYTHON_VERSION>
```

Once again, quit **all your opened terminal windows** (Cmd + Q) and restart one.

To check if this worked, run `python --version`. If you see `<PYTHON_VERSION>`, perfect! If not, ask a TA that will help you debug the problem thanks to `pyenv versions` and `type -a python` (`python` should be using the `.pyenv/shims` version first).

---

:thinking: Why aren't we using the latest `3.8+` Python version? Good question! For now, Python 3.8 is [not supported by Jupyter](https://github.com/jupyterlab/jupyterlab/issues/6487) which is a key tool in Data Science. Let's be patient and be thankful of the open-source community work!

---
