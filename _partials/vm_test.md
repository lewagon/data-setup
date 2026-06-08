
## Verify the connection to your virtual machine

Once the VM is started, it takes a couple of minutes for the SSH server to be ready and accept incoming connections ⏳

You may take a quick sip ☕️

Let's check the connection to the virtual machine with the command below:
- Replace `👉YOUR_IP_ADDRESS👈` with the IP address for your virtual machine provided to you by Le Wagon
- Replace `👉PATH_TO_YOUR_PRIVATE_KEY👈` with the path to your **PRIVATE** key

<details>
  <summary markdown='span'>Windows</summary>

``` bash
ssh -i 👉PATH_TO_YOUR_PRIVATE_KEY👈 lewagon@👉YOUR_IP_ADDRESS👈
# ssh -i C:\Users\<YourUsername>\.ssh\id_ed25519 lewagon@34.52.208.105
```
</details>

<details>
  <summary markdown='span'>MacOS & Linux</summary>

``` bash
ssh -i 👉PATH_TO_YOUR_PRIVATE_KEY👈 lewagon@👉YOUR_IP_ADDRESS👈
# ssh -i ~/.ssh/id_ed25519 lewagon@34.52.208.105
```
</details>


<details>

  <summary>❌ Operation timed out</summary>

  Error:

  ``` bash
  ssh -i ~/.ssh/id_ed25519 lewagon@34.52.208.105
  ssh: connect to host 34.52.208.105 port 22: Operation timed out
  ```

  {%- if ip_filtering %}
  The virtual machine is not started OR your IP address is not registered, ask a teacher for help 🙋
  {%- else %}
  The virtual machine is not started, ask a teacher for help 🙋
  {%- endif %}
</details>


<details>

  <summary>❌ Connection refused</summary>

  ``` bash
  ssh -i ~/.ssh/id_ed25519 lewagon@34.52.208.105
  ssh: connect to host 34.52.208.105 port 22: Connection refused
  ```

  This can happen if the virtual machine was just started and the SSH server is not ready yet to accept connections. If the issue persists after a couple of minutes, ask a teacher for help 🙋
</details>


A new terminal invite should be visible once connected to the machine:

``` bash
lewagon@actual-macaque-5115d600:~$
```

You can now disconnect from the virtual machine:

``` bash
exit
```

You will be back to the regular terminal prompt:

``` bash
lewagon@actual-macaque-5115d600:~$ exit
logout
Connection to 34.52.208.105 closed.
```
