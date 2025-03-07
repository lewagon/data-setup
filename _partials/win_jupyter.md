
### Configuring Jupyter Notebook to open in your browser

Let's generate the configuration file for **Jupyter Notebook**...

``` bash
jupyter notebook --generate-config
```

We will now edit the generated Jupyter configuration file:

``` bash
<CODE_EDITOR_CMD> $HOME/.jupyter/jupyter_notebook_config.py
```

Locate the following line in the configuration file:

``` python
# c.ServerApp.use_redirect_file = True
```

And replace it with this one **precisely** 👇 (including removing the `#` symbol)

``` python
c.ServerApp.use_redirect_file = False
```

Let's try to run Jupyter:

``` bash
jupyter notebook
```

This command should have opened a Jupyter page in your browser:

![](images/wsl_jupyter_notebook.png)

If it is not the case, please call a TA.

To stop the Jupyter server in the terminal, press `Ctrl` + `C`, enter y, then press Enter.
