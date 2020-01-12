## Install Python

Open the **Microsoft Store** from the Start Menu and search for `python`. Download the **Python 3.7** application.

Launch a Windows Powershell terminal prompt from the start menu.

Type the following command:

```bash
python --version
```

Do you get `3.7.x`? If not, ask a TA for help (look at `$Env:Path` and adjust the `Path` user variable with `rundll32 sysdm.cpl,EditEnvironmentVariables` launched in a Windows Terminal/Powershell tab).

---

:thinking: Why aren't we using the latest `3.8+` Python version? Good question! For now, Python 3.8 is [not supported by Jupyter](https://github.com/jupyterlab/jupyterlab/issues/6487) which is a key tool in Data Science. Let's be patient and be thankful of the open-source community work!

---

