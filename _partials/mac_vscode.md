
## Visual Studio Code - Your text editor

1. Download [Visual Studio Code for macOS](https://go.microsoft.com/fwlink/?LinkID=534106).
2. Open the browser's download list and locate the downloaded file.
3. Select the `magnifying glass` icon to open the file in `Finder`.
4. Drag Visual Studio Code.app to the **Applications** folder, making it available in the macOS Launchpad. **Don't skip this step!**
5. Add VS Code to your Dock by right-clicking on the icon to bring up the context menu and choosing Options, Keep in Dock.


### Launching from the command line

You can also run VS Code from the terminal by typing `code` after adding it to the path:

Launch VS Code by clicking the icon in your Dock.
Open the Command Palette (Ctrl+Shift+P) and type `shell command` to find the Shell Command: Install 'code' command in PATH command:


![](images/mac_vscode_command.png)

Now quit the Terminal (`⌘` + `Q`) and restart it.
Try typing `code` :point-right: if the VSCode opens in new window, you can proceed to the next point!


### VS Code Shortcuts

In VS Code:

>\- Click on `File`
>\- Click on `Preferences`
>\- Click on `Keymaps`
>\- Click on `Sublime Text Keymap and Settings Importer`
>\- Click on `Install`


### VS Code Extensions

Let's gain time now and add other extensions that will be helpful during your Bootcamp.


For each of these extensions:


>\- On the web page, click on `install`
>\- In the browser, accept to use VS Code to install the extension
>\- In VS Code, click on `install`

For everyone
- [Sublime Text Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)

For the Web Development bootcamp:
- [Rails Snippets](https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [ERB Helper Tags](https://marketplace.visualstudio.com/items?itemName=rayhanw.erb-helpers)
- [ruby-rubocop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop)

For the Data Science bootcamp:
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)

### VS Code Settings
>\- Press `Ctrl` + `,` on your keyboard to open the settings
>\- In the search bar, type `emmet`
>\- Click on the first **`Edit in settings.json`** link


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