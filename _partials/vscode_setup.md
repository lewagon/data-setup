### <CODE_EDITOR> Extensions

Let's gain time now and add other extensions that will be helpful during your Bootcamp:

```bash
<CODE_EDITOR_CMD> --install-extension ms-vscode.sublime-keybindings ms-python.python ms-toolsai.jupyter KevinRose.vsc-python-indent MS-vsliveshare.vsliveshare
```

### <CODE_EDITOR> Settings

- On macOS, press `CMD` + `,` on your keyboard (or `CTRL` + `,` on Windows or Linux) to open the settings
- In the search bar, type `emmet`
- Click on the first **`Edit in settings.json`** link

Paste the following just before the last `}`:

```bash
"emmet.triggerExpansionOnTab": true,
"emmet.includeLanguages": {
  "erb": "html"
},
```

It should look like this:

![vscode_emmet](images/vscode_emmet.jpg)

:warning: You should add a comma if there is none after the **`]`** like line 26 in the image above :point_up:

:warning: Don't forget to save those changes!
