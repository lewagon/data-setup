## Docker 🐋

Docker es una plataforma abierta para desarrollo, entrega y operación de aplicaciones.

_Si ya tienes Docker instalado en tu máquina, por favor actualízalo con la versión más reciente_

### Instalación de Docker

Ve a la [documentación de instalación de Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

Luego sigue las instrucciones del tutorial para instalar Docker **usando el repositorio**. Hay 2 pasos:

- SET UP THE REPOSITORY. Esto significa configurar el repositorio
- INSTALL DOCKER ENGINE. Esto significa instalar el motor de Docker

Cuando termines, podrás ejecutar lo siguiente:

```bash
sudo service docker start
```

```bash
sudo docker run hello-world
```

Debería aparecer el siguiente mensaje:

![](images/docker_hello.png)

```bash
sudo service docker stop
```
