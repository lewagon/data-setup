### Final Check

To make sure everything works fine, close <CODE_EDITOR>, then open your Ubuntu terminal:

- Press `Windows` + `R`
- Type  `ubuntu`
- Press `Enter`

In Ubuntu, let's try to launch <CODE_EDITOR>:

### <CODE_EDITOR> Shortcuts

In <CODE_EDITOR>:

- Click on `File`
- Click on `Preferences`
- Click on `Keymaps`
- Click on `Sublime Text Keymap and Settings Importer`
- Click on `Install`

### <CODE_EDITOR> Extensions

Let's gain time now and add other extensions that will be helpful during your Bootcamp:

```bash
<CODE_EDITOR_CMD> --install-extension ms-vscode.sublime-keybindings ms-python.python ms-toolsai.jupyter KevinRose.vsc-python-indent MS-vsliveshare.vsliveshare
```

### <CODE_EDITOR> Settings
- Press `Ctrl` + `,` on your keyboard to open the settings
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

:warning: You should add a comma if there is none after the **`]`** like line 26 in the image above ☝️
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
