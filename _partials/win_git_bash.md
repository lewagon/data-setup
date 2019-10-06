# Git Bash

Git bash will allow you to run some linux command on Windows.  
Go to [Git-SCM](https://git-scm.com/download/wim) and click on "Windows".  

![](images/gitbash_1.png)

Click on "Next".  

![](images/gitbash_2.png)

Leave the default installation folder and click on "Next".  

![](images/gitbash_3.png)

Leave the default components qnd click on "Next".  

![](images/gitbash_4.png)

Leave the default name "Git" and click on "Next".  

![](images/gitbash_5.png)

In the dropdown, choose your new favorite text editor "Use Sublime Text as Git's default editor" and click on "Next".  

![](images/gitbash_6.png)

Click on "Next".  

![](images/gitbash_7.png)

Once again, click on "Next".

![](images/gitbash_8.png)

Guess what? Click on "Next" :)  

![](images/gitbash_9.png)

"Nexttttt!".  

![](images/gitbash_10.png)

"Again!".  

![](images/gitbash_11.png)

And again! Just kidding, click on "Install".  

![](images/gitbash_12.png)

Lastly, check "Launch Git Bash", uncheck "View Releave Notes" and click on "Finish".  

![](images/gitbash_13.png)

The Git Bash terminal should open.  

![](images/gitbash_14.png)

Please run the following command:  

```bash
curl -Ls https://raw.githubusercontent.com/lewagon/data-setup/master/.bash_profile > .bash_profile
exit
```  

Reopen Git bash and run the following command:  

```bash
conda init bash
``` 

Then run this one:  

```bash
conda activate base
```

Let's install two tools will need to tests our Python code ;)  

```bash
conda install pytest
conda install pylint
``` 

If you have an error, please ask a TA.  

To make sure Python is properly installed, please run the following command:  

```bash
python -i
``` 

You should get an answer like 
```bash
Python 3.7.3 (default...
```  

To exit this check please run
```bash
exit()
```

Lastly, let's create the directory where you will do the exercices.  
**Don't blindly copy paste this line**, replace `replace_this_with_your_github_username` with *your*
own github usernickname.

```bash
export GITHUB_USERNAME=replace_this_with_your_github_username

# Example:
#   export GITHUB_USERNAME=ssaunier
```

Then run:

```bash
mkdir -p ~/code/$GITHUB_USERNAME
```
  
