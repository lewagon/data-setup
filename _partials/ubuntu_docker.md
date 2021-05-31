## Docker 🐋

Docker is an open platform for developing, shipping, and running applications.

_if you already have Docker installed on your machine please update with the latest version_

### Install Docker

$WINDOWS_START
Go to [Docker for WSL2](https://docs.docker.com/docker-for-windows/wsl/).
$WINDOWS_END
$LINUX_START
Go to [Docker install documentation](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).
$LINUX_END

Then follow the tutorial instructions to install Docker **using the repository**. There are 2 steps:

- SET UP THE REPOSITORY
- INSTALL DOCKER ENGINE

Once done, you should be able to run:

```bash
sudo service docker start
```

```bash
sudo docker run hello-world
```

The following message should print:

![](images/docker_hello.png)

```bash
sudo service docker stop
```
