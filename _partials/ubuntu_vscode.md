
## Visual Studio Code - Your text editor

A text editor is one of the most important tools of a developer.
Follow these instructions in the Terminal:

```bash
sudo snap install --classic code
```

:point_up: This command will ask for your password with: `[sudo] password for <username>:`. Don't panick! Calmly type your password key by key. You won't have a visual feedback (like little `*`), that's **perfectly normal**, keep on typing. When you're done, hit `Enter` :muscle:.

In case you don't have `snap` installed - ask a TA for help.


Now let's try to launch your VSCode from **the Terminal**:

```bash
code
```

If the text editor opens in a new window, you can move forward!

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
