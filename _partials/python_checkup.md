## Python setup check

### Python and packages check

Let's reset your terminal:

```bash
cd ~/code && exec zsh
```

Check your Python version with the following commands:
```bash
zsh -c "$(curl -fsSL {{ PYTHON_CHECKER_URL }})" {{ PYTHON_VERSION }}
```

Run the following command to check if you successfully installed the required packages:
```bash
zsh -c "$(curl -fsSL {{ PIP_CHECKER_URL }})"
```

Now run the following command to check if you can load these packages:
```bash
python -c "$(curl -fsSL {{ PIP_LOADER_URL }})"
```

### Jupyter check

Make sure you can run Jupyter:

```bash
jupyter notebook
```

Let's open the jupyter app:

<details>

  <summary>Regular setup</summary>

  Your web browser should open on a `jupyter` window.
</details>


<details>

  <summary>Virtual machine setup</summary>

  VSCode detects that a jupyter notebook started in your virtual machine and creates a port forward in order to allow you to open the application in your browser.

  Hit Open in Browser or go to http://localhost:8888/ (the url to use is available in the terminal).

  ![](images/jupyter_port_forward.png)

  On the first run, jupyter will ask for the token displayed in the terminal of your virtual machine in order to allow you to connect to the application from your local machine.

  Fill the token and hit Log in.

  ![](images/jupyter_token.png)

  You are now interacting from your local machine with the jupyter application running in your virtual machine.
</details>


You now have access to the `jupyter` window:

![jupyter.png](images/jupyter.png)

Click on `New` and in the dropdown menu select `Python 3 (ipykernel)`:

![jupyter_new.png](images/jupyter_new.png)

A tab should open on a new notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

Make sure that you are running the correct python version in the notebook. Open a cell and run:
``` python
import sys; sys.version
```

It should output `{{ PYTHON_VERSION }}` followed by some more details. If not, check with a TA.

You can close your web browser then terminate the jupyter server with `CTRL` + `C`.

Here you have it! A complete python virtual env with all the third-party packages you'll need for the whole bootcamp.
