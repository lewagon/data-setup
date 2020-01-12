## Install Python

Download [Python <PYTHON_VERSION> Installer](https://www.python.org/ftp/python/<PYTHON_VERSION>/python-<PYTHON_VERSION>-amd64.exe) and execute it.

:warning: Do not forget to tick the "Add Python to PATH" option.

![](images/win_python.png)

Launch Git Bash. Type the following command:

```bash
python --version
```

You should see <PYTHON_VERSION>! You can also check that it's coming from `AppData/Local/Programs` with:

```bash
type -a python
```

---

:thinking: Why aren't we using the latest `3.8+` Python version? Good question! For now, Python 3.8 is [not supported by Jupyter](https://github.com/jupyterlab/jupyterlab/issues/6487) which is a key tool in Data Science. Let's be patient and be thankful of the open-source community work!

---

