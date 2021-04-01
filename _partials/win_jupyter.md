
## Configuring Jupyter Notebook to open in your browser

Let's generate the configuration file for **Jupyter Notebook**...

``` bash
jupyter notebook --generate-config
```

⚠️ Please copy the path returned by the previous command.

We will now edit the generated Jupyter configuration file:

``` bash
<CODE_EDITOR_CMD> $HOME/.jupyter/jupyter_notebook_config.py
```

Locate the following line in the configuration file:

``` python
# c.NotebookApp.use_redirect_file = True
```

And replace it with this one:

``` python
c.NotebookApp.use_redirect_file = False
```

Let's try to run Jupyter:

``` bash
jupyter notebook
```

This command should have opened a Jupyter page in your browser:

![](images/wsl_jupyter_notebook.png)

If it is not the case, please call a TA.

To stop the Jupyter server in the terminal, press Ctrl + C, enter y, then press Enter.
