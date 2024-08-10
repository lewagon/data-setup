## Docker 🐋

Docker es una plataforma abierta para desarrollo, entrega y operación de aplicaciones.

_Si ya tienes Docker instalado en tu máquina, por favor actualízalo con la versión más reciente_

### Instalación de Docker

Ve a la [documentación de instalación de Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

Luego sigue las instrucciones del tutorial para instalar Docker **usando el repositorio**. Hay 2 pasos:

1. Set up Docker's apt repository. > Esto significa configurar el repositorio
2. Install the Docker packages. > Esto significa instalar el motor de Docker

Ahora, asegurémonos de que podemos ejecutar `docker` sin `sudo`.

Ejecute los siguientes comandos uno por uno:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo rm -rf ~/.docker/
```

Cuando termines, podrás ejecutar lo siguiente:

```bash
docker run hello-world
```

Debería aparecer el siguiente mensaje:

![](images/docker_hello.png)
