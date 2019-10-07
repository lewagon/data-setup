# Sublime Text 3 - Package

Let's go back to Sublime Text and install some packages that will help us to create better code.

Press the windows key + R at the same time to open the "Run" tool. Type the command:

```bash
%USERPROFILE%\AppData\Roaming\Sublime Text 3\Packages\User
```

Click on "OK"

![](images/sublime_7.png)

A new Explorer window should open, it should be empty. Right click and chose "Git Bash here".

A new Git Bash terminal will open. Please copy the following command:

```bash
curl -Ls https://raw.githubusercontent.com/lewagon/dotfiles/master/Preferences.sublime-settings > Preferences.sublime-settings
```

### Package install

Launch `Sublime Text 3`.

Install package controll via the Command Palette (`Ctrl` + `Shift` + `P`) and type `Install Package Control`. Type `Enter` and wait a few seconds. You should get an alert telling you package control has been successfully installed.

Now we can install the package `MagicPython`.<br>
You can install a package via the Command Palette (`Ctrl` + `Shift` + `P`) then type `Install package`,<br>
![](images/sublime_8.png)

Then type the name of the package you want to install and press `Enter`.
![](images/sublime_9.png)
