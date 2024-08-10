## Docker 🐋

Docker es una plataforma abierta para desarrollo, entrega y operación de aplicaciones.

_Si ya tienes Docker instalado en tu máquina, por favor actualízalo con la versión más reciente_

### Instalación de Docker

Ve a [Docker para WSL2](https://docs.docker.com/docker-for-windows/wsl/).

Descarga e instala el backend de Docker Desktop WSL 2.

Cuando termines, inicia Docker.

Deberías poder usarlo en una terminal Ubuntu:

```bash
docker run hello-world
```

Debería aparecer el siguiente mensaje:

![](images/docker_hello.png)

<details>
  <summary markdown='span'>Permission denied? (WSL / Ubuntu)</summary>

Ejecute los siguientes comandos uno por uno:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Intente `docker info` nuevamente.

¿Ve este error?

```
WARNING: Error loading config file: /home/user/.docker/config.json - stat /home/user/.docker/config.json: permission denied`?
```

Ejecute el siguiente comando:

```bash
sudo rm -rf ~/.docker/
```

Intente `docker info` nuevamente.

</details>
