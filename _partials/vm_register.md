
## Redeem your Virtual Machine (VM)

Let's redeem the virtual machine on which we will work.

In order to move forwards, you will need to use:
- The SSH **public** and **PRIVATE** keys you just created
- The alias provided to you by Le Wagon
- The IP address provided to you by Le Wagon

<details>

  <summary>🤔 What are the SSH public and private keys ?</summary>

  A SSH key is a pair constituted of linked public and private keys.

  The **PRIVATE** part of the SSH key (private key) is the part that allows you alone to use the key. It should not be communicated to anyone and should never leave your machine.

  The **public** part of the SSH key (public key) is the part that identifies you when communicating over SSH. It can be communicated widely.

  The file storing the public key ends in `.pub` (for example `id_ed25519.pub`), while the file storing the private key does not have an extension (for example `id_ed25519`).

  In this setup we will publish the **public** key to the virtual machine provided by Le Wagon in order to identify ourselves. We will then use the **PRIVATE** key to authenticate remotely and connect to the virtual machine.
</details>


Retrieve your SSH **public** key using the command below:
- Replace `👉PATH_TO_YOUR_PUBLIC_KEY👈` with the path to your **public** key

<details>
  <summary markdown='span'>Windows</summary>

```bash
type 👉PATH_TO_YOUR_PUBLIC_KEY👈
# type C:\Users\<YourUsername>\.ssh\id_ed25519.pub
```
</details>

<details>
  <summary markdown='span'>MacOS & Linux</summary>

``` bash
cat 👉PATH_TO_YOUR_PUBLIC_KEY👈
# cat ~/.ssh/id_ed25519.pub
```
</details>


You should see something similar to the following even though multiple formats exist:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8ToZnCWvZkjqw6ueq3RRWSGtGE6DE+VODZQEHibYMY alexdev@gmail.com
```

Fetch the alias provided to you by Le Wagon. The alias contains random pet names separated by dashes, for exampe `actual-macaque-5115d600`. If you cannot find it, ask a teacher for help 🙋

Now let's register your SSH key:
- Go to https://github.com/lewagon/remote-setup/issues
- Click on **New issue**
- Select **New SSH Key**
- Enter your alias
- Enter your SSH **public** key
- Validate with **Create**

![](images/register_ssh_key.png)

👉 Your SSH **public** key is being added to your virtual machine

After a couple of minutes, a comment should appear and indicate that the operation is complete. If the registration fails, ask a teacher for help 🙋

![](images/register_complete.png)
