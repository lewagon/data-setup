### <CODE_EDITOR> Extensions

Let's gain time now and add other extensions that will be helpful during your Bootcamp:

```bash
<CODE_EDITOR_CMD> --install-extension ms-vscode.sublime-keybindings ms-python.python ms-toolsai.jupyter KevinRose.vsc-python-indent MS-vsliveshare.vsliveshare
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

:warning: You should add a comma if there is none after the **`]`** like line 26 in the image above :point_up:

:warning: Don't forget to save those changes!

### Final Check

To make sure everything works fine, close <CODE_EDITOR>, then open your Ubuntu Terminal:

- Press `Windows` + `R`
- Type  `ubuntu`
- Press `Enter`

In Ubuntu, let's try to launch <CODE_EDITOR>:

```bash
<CODE_EDITOR_CMD>
```

&nbsp;

&nbsp;&nbsp;&nbsp; :x: If <CODE_EDITOR> does not open, please **contact a teacher**

&nbsp;&nbsp;&nbsp; :white_check_mark: If <CODE_EDITOR> opens, your code editor is ready! :muscle:
