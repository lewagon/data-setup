## Install useful extra tools

### Handle

Handle is an interactive process viewer for your terminal.

- Go to https://docs.microsoft.com/en-us/sysinternals/downloads/handle then click on `Download Handle`
- Open the archive _Handle.zip_
- Copy the _handle.exe_ file to _C:\WINDOWS\System32_
- Restart Git Bash then run:
```bash
handle -accepteula
```
And this one:
```bash
handle -p explorer.exe
```

You should get a long list of logs starting with:

![](images/handle.PNG)

### Windows Directory Statistics

WinDirStat is a disk usage statistics viewer application.

- Go to https://windirstat.net/download.html then in the **List of official dowload mirrors**, click on **SourceForge**
- Save the executable file on your disk

![](images/windirstat_save.PNG)

- Double-click on the file to install WinDirStat

![](images/windirstat_tol.PNG)

- **Accept** the terms of the licence then click **Next**

![](images/windirstat_options.PNG)

- Leave the default Components options then click **Next**

![](images/windirstat_install.PNG)

- Choose the destination folder then click **Install**

![](images/windirstat_launch.PNG)

- When the installation has ended, click **Next** one last time!

![](images/windirstat_result.PNG)

- You can perform a disk analysis on `C:/` to try WinDirStat, after a minute you should get this kind of result

### hub

hub is a command line tool that wraps `git` in order to extend it with extra features and commands that make working with GitHub easier.

- Install `chocolatey` (package manager for windows) https://chocolatey.org/install
- Restart your Git Bash as an administrator (right click - execute as an administrator)
- Then run:

```bash
choco install hub
```
and answer `y` to each questions then **restart your terminal**.
