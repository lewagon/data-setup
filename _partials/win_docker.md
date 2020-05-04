## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

_if you already have Docker installed on your machine please update with the latest version_

First, let's check your Windows version **Start → Settings → System → About**. Look where it says **Edition**.
If you have a Home version please go to [Docker on Windows Home](https://github.com/lewagon/setup/blob/master/WINDOWS.md#docker-on-windows-home)
If you have a Pro version, please follow [Docker on Windows Pro](https://github.com/lewagon/setup/blob/master/WINDOWS.md#docker-on-windows-pro) below 👇:

### Docker on Windows Pro

Go to [Docker](https://docs.docker.com/get-docker/) website and choose your operating system:

![](images/docker.png)

Then follow the setup instructions, you are going to install a desktop application.

Once done and launched, check Docker is up and running:

```bash
docker info
```

You should get:

![](images/docker_info.png)

Carry on with your [onboarding](https://github.com/lewagon/data-setup/blob/master/WINDOWS.md#alumni) 😎.

### Docker on Windows Home

#### Virtualization

We need to ensure that the Virtualization options are enabled in the BIOS of your computer.

For many computers, this is already the case. Let's check:

- Press `Ctrl + Alt + Del`.
- Select **Task Manager**.
- Click on the **Performance** tab.
- Click on **CPU**.
- The status will be listed under the graph and will say "Virtualization: Enabled" if this tool is enabled.

![task_manager.jpg](images/task_manager.jpg)

If **Virtualization** is already enabled, go directly to [Docker Toolbox](https://github.com/lewagon/setup/blob/master/WINDOWS.md#docker-toolbox).

If not, we need to enable it, which is a process that is different for each model of computer, so we can only offer vague guidelines in this guide. Please ask a teacher as soon as you get stuck!

Let's retrieve your motherboard model :muscle:

Click on **Start** and type **System Information** and open it.

Locate the **System Model** line, the value on the right is your motherboard model.

Now because everything is dependant on your motherboard model, we will have to do a Google search on how to enable the Virtualization option with this model. 

:warning: We invite you to contact a teacher so you can complete this part of the setup together, as it might be a bit scary to not have clear guidelines. Choose the communication tool of your choice so the teacher can see your screen (your computer will have to be turned off during the setup so please use your phone, WhatsApp, Facetime etc..) :man_mechanic:​ :warning:

If we take my example:

![wsl2_virtualization.png](images/wsl2_virtualization.png)

So I googled "*UX310UA bios enable virtualization*" and the first video in the results taught me how to do it. Part of being a developer is searching for information and applying it to your work :nerd_face:.

Follow the instructions you found to enable Virtualization and come back here, we will be waiting :smile:.


#### Docker Toolbox

Follow the official guidelines from [docker's website](https://docs.docker.com/toolbox/toolbox_install_windows/#step-2-install-docker-toolbox) starting from **Step 2: Install Docker Toolbox** until **Step 3.4**

If you encounter the error `This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory`, open **C:\Program Files\Docker Toolbox\start.sh** with an editor.
Close Docker QuickStart Terminal.
Locate the line 69, and replace it from:
```bash
"${DOCKER_MACHINE}" create -d virtualbox $PROXY_ENV "${VM}"
```
To:
```bash
"${DOCKER_MACHINE}" create -d virtualbox --virtualbox-no-vtx-check $PROXY_ENV "${VM}"
```