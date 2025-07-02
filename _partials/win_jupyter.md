
### Configuring Jupyter Notebook to open in your browser

First, let's configure your default browser again. We did this before, but when we installed the dotfiles it got removed. Not a problem, run this command to configure the settings again:

```bash
grep -E "export (GH_)*BROWSER" .zshrc.backup >> .zshrc
```

Then, restart your terminal with:

```bash
exec zsh
```

Let's generate the configuration file for **Jupyter Notebook**...

``` bash
jupyter notebook --generate-config
```

We will now edit the generated Jupyter configuration file:

``` bash
sed -i.backup 's/# c.ServerApp.use_redirect_file = True/c.ServerApp.use_redirect_file = False/' ~/.jupyter/jupyter_notebook_config.py
```

Let's try to run Jupyter:

``` bash
jupyter notebook
```

This command should have opened a Jupyter page in your browser:

![](images/wsl_jupyter_notebook.png)

If it is not the case, please call a TA.

To stop the Jupyter server in the terminal, press `Ctrl` + `C`, enter y, then press Enter.
