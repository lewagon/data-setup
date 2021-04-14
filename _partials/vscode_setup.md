### <CODE_EDITOR> Extensions

Let's gain time now and add other extensions that will be helpful during your Bootcamp:

```bash
<CODE_EDITOR_CMD> --install-extension ms-vscode.sublime-keybindings
<CODE_EDITOR_CMD> --install-extension ms-python.python
<CODE_EDITOR_CMD> --install-extension ms-toolsai.jupyter
<CODE_EDITOR_CMD> --install-extension KevinRose.vsc-python-indent
<CODE_EDITOR_CMD> --install-extension MS-vsliveshare.vsliveshare
<CODE_EDITOR_CMD> --install-extension ms-python.vscode-pylance
```

### <CODE_EDITOR> Settings

- On macOS, press `Cmd` + `,` on your keyboard (or `Ctrl` + `,` on Windows or Linux) to open the settings
- Click on the `Open Settings (JSON)`

![vscode_user_settings](images/vscode_user_settings.png)

Paste the following just before the last `}`:

```bash
"emmet.triggerExpansionOnTab": true,
"emmet.includeLanguages": {
  "erb": "html"
},
"python.pythonPath": "~/.pyenv/shims/python",
"python.formatting.provider": "yapf",
"python.linting.enabled": true,
"python.linting.pylintEnabled": false,
"python.linting.flake8Enabled": true,
"workbench.settings.editor": "json",
"workbench.settings.openDefaultSettings": true,
"workbench.settings.useSplitJSON": true,
"files.exclude": {
  "**/.pytest_cache": true,
  "**/.ipynb_checkpoints": true,
  "**/__pycache__": true,
  "**/.egg-info": true,
},
```

It should look like this:

![vscode_emmet](images/vscode_emmet.jpg)

:warning: You should add a comma if there is none after the **`]`** like line 23 in the image above :point_up:

:warning: Don't forget to save those changes!
