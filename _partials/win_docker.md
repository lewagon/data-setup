## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

_if you already have Docker installed on your machine please update with the latest version_

### Install Docker

Go to [Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/wsl/).

Download and install Docker Desktop.

If you have an Intel or AMD processor, choose the first option ending with "x86_64".

<details>
  <summary markdown='span'>Not sure which processor you have?</summary>

  Most probably you'll need the `x86_64`version, that is if you have an Intel or AMD processor.

  If you don't know which processor your machine has,  run `arch` in your Ubuntu terminal. Check its output:
  - `x86_64`: choose the first option "x86_64"
  - `aarch64`: choose the second option "Arm"

</details>


Once done, start Docker.

You should be able to run in a Ubuntu terminal:

```bash
docker run hello-world
```

The following message should print:

![](images/docker_hello.png)

<details>
  <summary markdown='span'>Permission denied?</summary>

Run the following commands one by one:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Try `docker run hello-world` again.

Seeing this error?
```
WARNING: Error loading config file: /home/user/.docker/config.json - stat /home/user/.docker/config.json: permission denied`?
```

Run the following command:

```bash
sudo rm -rf ~/.docker/
```

Try `docker run hello-world` again.

</details>
