# Sqlite3

To persist our data, we need a database.  
We are going to use Sqlite3.  

Please go to [sqlite download](https://www.sqlite.org/download.html) and under "Precompiled Binaries for Windows", click on "sqlite-dll-win32-x86-xxxxxxx.zip".  

A popup will appear at the bottom of the page, click on "Save".  

The popup will change and click on "Open folder".  

Open a new explorer window and go to C:  

Create a new folder there and call it "sqlite".  

Go to the downloaded file and right click on it and chose "Extract All". Click on "Extract".  

A new window will open with 2 files in it. Copy those files in the C:/sqlite/  

Go back to the website and this time under "Precompiled Binaries for Windows", click on "sqlite-tools-win32-x86-xxxxxxx.zip".  

A popup will appear at the bottom of the page, click on "Save".

The popup will change and click on "Open folder".

Open a new explorer window and go to C:

Create a new folder there and call it "sqlite".

Go to the downloaded file and right click on it and chose "Extract All". Click on "Extract".

A new window will open with 2 files in it. Copy those files in the C:/sqlite/  

Open a new Git Bash terminal and run the following command:  

```bash
echo 'export PATH="/c/sqlite/:${PATH}"' >> .bash_profile  
```

Restart your Git Bash terminal.  

To make sure everything works, please run the following command:  

```bash
sqlite3 -version
```

You should get an answer like: "3.30.0.....", if not please ask a TA.  
