# WSL only - This fixes the case where the tree is opened instead of a specified file
# This needs to go into ~/.jupyter/jupyter_notebook_config.py

import os
import sys

# Extract the requested filename from command-line arguments
target_file = None
for arg in sys.argv:
    if arg.endswith('.ipynb'):
        target_file = arg
        break

if target_file:
    # Target the actual application extension traitlet handling Notebook 7 routing
    c.JupyterNotebookApp.default_url = f"/notebooks/{target_file}"

# Keep your WSL browser routing intact
BROWSER_PATH = os.environ.get('BROWSER').replace(' ', '\ ')
c.ServerApp.browser = f'{BROWSER_PATH} %s'
c.ServerApp.use_redirect_file = False
