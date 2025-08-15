## Docker 🐋

Docker es una plataforma abierta para desarrollo, entrega y operación de aplicaciones.

_Si ya tienes Docker instalado en tu máquina, por favor actualízalo con la versión más reciente_

### Instalación de Docker

Ve a [Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/wsl/).

Descarga e instala el Docker Desktop.

Si tienes un procesador Intel o AMD, elige la primera opción que termina con "x86_64".

<details>
  <summary markdown='span'>¿No estás seguro de qué procesador tienes?</summary>

  Lo más probable es que necesites la versión `x86_64`, es decir, si tienes un procesador Intel o AMD.

  Si no sabes qué procesador tiene tu máquina, ejecuta `arch` en tu terminal de Ubuntu. Verifica su salida:
  - `x86_64`: elige la primera opción "x86_64"
  - `aarch64`: elige la segunda opción "Arm"

</details>


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
