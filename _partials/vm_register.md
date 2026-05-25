
## Authenticate to your virtual machine

In order to move forwards, you will need to use:
- The SSH **public** and **PRIVATE** keys you just created
- The alias provided to you by Le Wagon

<details>

  <summary>🤔 What are the SSH public and private keys ?</summary>

  A SSH key is a pair constituted of linked public and private keys.

  The **PRIVATE** part of the SSH key (private key) is the part that allows you **alone** to use the key. It should not be communicated to anyone and should never leave your machine.

  The **public** part of the SSH key (public key) is the part that identifies you when communicating over SSH. It can be communicated widely.

  The file storing the public key ends in `.pub` (for example `id_ed25519.pub`), while the file storing the private key does not have an extension (for example `id_ed25519`).

  In this setup we will publish the **public** key to the virtual machine provided by Le Wagon in order to identify ourselves. We will then use the **PRIVATE** key to authenticate remotely and connect to the virtual machine.
</details>

Retrieve your SSH **public** key using the command below:
- Replace the path to your **public** key

``` bash
cat 👉PATH_TO_YOUR_PUBLIC_KEY👈
# cat ~/.ssh/id_ed25519.pub
```

Fetch the alias provided to you by Le Wagon. The alias contains random pet names separated by dashes, for exampe `daring-tuna-1a03dab5`. If you cannot find it, ask a teacher for help 🙋

Now let's register your SSH key:
- Go to https://github.com/lewagon/remote-setup/issues
- Click on **New issue**
- Select **New SSH Key**
- Enter your alias
- Enter your SSH **public** key
- Validate with **Enter**

![](images/register_ssh_key.png)

👉 Your SSH **public** key is being added to your virtual machine

After a couple of minutes, a comment should indicate when the operation is complete. If the registration fails, ask a teacher for help 🙋

❗️ Retrieve the IP address of your virtual machine and note it down for later

![](images/register_complete.png)

Now let's check the connection to the virtual machine with the command below:
- Replace your IP address
- Replace the path to your **PRIVATE** key

``` bash
ssh -i 👉PATH_TO_YOUR_PRIVATE_KEY👈 lewagon@👉YOUR_IP_ADDRESS👈
# ssh -i ~/.ssh/id_ed25519 lewagon@34.52.208.105
```

<details>

  <summary>❌ Operation timed out</summary>

  Error:

  ``` bash
  ssh -i ~/.ssh/id_ed25519_data_eng_setup lewagon@34.52.208.105
  ssh: connect to host 34.52.208.105 port 22: Operation timed out
  ```

  The virtual machine is not started, ask a teacher for help 🙋
</details>

<details>

  <summary>❌ Connection refused</summary>

  ``` bash
  ssh -i ~/.ssh/id_ed25519_data_eng_setup lewagon@34.52.208.105
  ssh: connect to host 34.52.208.105 port 22: Connection refused
  ```

  This can happen if the virtual machine was just started and the SSH server is not ready yet to accept connections. If the issue persists after a couple of minutes, ask a teacher for help 🙋
</details>
