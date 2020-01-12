## Virtual Environment

Type the following to update `pip`, the command installing packages from [`pypi.org`](https://pypi.org)

Now we will install the `virtualenv` package:

```bash
pip install virtualenv
```

Let's create a new virtual environment for the whole bootcamp:

```bash
mkdir $HOME/.venvs
cd $HOME/.venvs
python -m venv lewagon
```

Awesome! The virtual environment has been created. Let's now make sure it's always activated when launching a Powershell session. Copy-paste the following into the Powershell window:

```powershell
New-Item $profile -Type File -Force
notepad $profile
```

In Notepad, copy paste the following lines, save and close it:

```powershell
# Activate the `lewagon` virtualenv by default when launching a Powershell terminal
& $HOME\.venvs\lewagon\Scripts\Activate.ps1

# Create the `subl` command to open a folder (`subl .`) from the command line into Sublime Text
Set-Alias -Name subl -Value 'C:\Program Files\Sublime Text 3\subl.exe'

# Emulate `touch <file>` feature of UNIX
function touch {set-content -Path ($args[0]) -Value ($null)}

# Use `open .` to open current folder in Windows Explorer
Set-Alias -Name open -Value explorer
```

Close all the Windows Powershell windows. Launch a new one. You should see a prompt like this:

```bash
(lewagon) PS C:\Users\your_name>
```

If you don't, ask a TA!
