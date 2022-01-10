### Python setup check up

Check your Python version with the following commands:
```bash
zsh -c "$(curl -fsSL <PYTHON_CHECKER_URL>)" <PYTHON_VERSION>
```

Run the following command to check if you successfully installed the required packages:
```bash
zsh -c "$(curl -fsSL <PIP_CHECKER_URL>)"
```

Now run the following command to check if you can load these packages:
```bash
python -c "$(curl -fsSL <PIP_LOADER_URL>)"
```

Make sure you can run Jupyter:

```bash
jupyter notebook
```

And open a `Python 3` notebook.

Make sure that you are running the correct python version in the notebook. Open a cell and run :
``` python
import sys; sys.version
```

Here you have it! A complete python virtual env with all the third-party packages you'll need for the whole bootcamp.
