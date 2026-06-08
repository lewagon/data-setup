
## Register your IP address

In order to further improve the security of your VM, it has been configured to refuse incoming SSH connections unless from registered IP addresses.

Let's register your IP address to allow SSH access to your VM from your current location.

In order to move forwards, you will need to use:
- The alias provided to you by Le Wagon
- Your **public** IP address (**NOT** the **VM** IP address provided to you by Le Wagon)

<details>

  <summary>🤔 How does my public IP address differ from my VM IP address ?</summary>

  Your **public** IP address is the address from which you are accessing the network. It changes whenever you change locations or if you switch your means of connecting to the Internet.

  This IP address is coined as public since it is the address any website or application you connect to sees. It is the IP address we need the VM to accept connections from.

  Your **public** IP address identifies the location from which you connect.

  The **VM** IP address identifies the machine you want to connect to.

  In order to connect to your VM using SSH you need to both:
  - Connect from a known location, identified by a registered **public** IP address
  - Connect using a known user, identified by the registered **public** SSH key
</details>


Retrieve your public IP address:

<details>
  <summary markdown='span'>Windows</summary>

```bash
curl -s ifconfig.me && echo
```
</details>

<details>
  <summary markdown='span'>MacOS & Linux</summary>

``` bash
curl -s ifconfig.me && echo
```
</details>

<details>
  <summary markdown='span'>Browser alternative</summary>

Open https://ifconfig.me in your browser and copy the IP shown.

![](images/vm_retrieve_ip.png)
</details>


Copy your public IP address.

Now let's register your public IP address:
- Go to https://github.com/lewagon/remote-setup/issues
- Click on **New issue**
- Select **Register IP address**
- Enter your alias
- Enter your public IP address
- Validate with **Create**

![](images/register_ip_address.png)

👉 Your public IP address is being allowed so you can SSH to your virtual machine from your location

After a couple of minutes, a comment should appear and indicate that the operation is complete. If the registration fails, ask a teacher for help 🙋

![](images/register_ip_complete.png)
