Ahora vamos a mover el archivo json de la cuenta de servicio desde tu disco en Windows al disco en Ubuntu. Esto le permitirá a las herramientas de desarrollo en Ubuntu acceder a los recursos de tu cuenta GCP.

Primero crea un directorio para almacenar el archivo.

👉 Abre una terminal en Ubuntu y ejecuta los siguiente comandos

🚨 reemplaza el `GITHUB_NICKNAME` por tu nickname de **GitHub**

``` bash
cd ~/code/GITHUB_NICKNAME
ls -la
```

Si el comando no muestra el directorio `dotfiles`, pídele ayuda a un TA 🙏

Si no es el caso, puedes proceder con la configuración:

``` bash
mkdir gcp
```

![](images/wsl-gcp-dir.png)

Ahora moveremos el archivo json de la cuenta de servicio al directorio `gcp` que acabamos de crear.

Abre un **Buscador de Archivos** de Windows (Win + E) y localiza el directorio `gcp` en el sistema de archivo de Ubuntu.

Puedes optar por las siguientes alternativas:
- Usar el enlace de **Acceso rápido** que creamos hace un rato
- O escribir la localización del directorio `gcp` manualmente en la barra de direcciones del sistema de archivos de Ubuntu:

```
\\wsl$\Ubuntu\home\UBUNTU_USERNAME\code\GITHUB_NICKNAME
```


🚨 Si optas por la segunda opción:
- reemplaza el `UBUNTU_USERNAME` por el usuario que escogiste durante la configuración de **Ubuntu**
- reemplaza el `GITHUB_NICKNAME` por tu nickname de **GitHub**

![](images/wsl-gcp-key.png)

Cuando hayas localizado el directorio `gcp` en el **Buscador de Archivos** de Windows, ponle el archivo json de la cuenta de servicio que descargaste.

Ahora deberías poder ver el archivo desde el sistema de archivos de Ubuntu.

👉 Abre una terminal en Ubuntu y verifica que el archivo json de la cuenta de servicio ha sido movido

``` bash
cd gcp
ls -la
```

![](images/wsl-gcp-dir-2.png)

Si no ves el archivo json de la cuenta de servicio en el directorio `gcp`, pídele ayuda a un TA 🙏

Ahora almacenaremos la ruta al archivo json de la cuenta de servicio en una variable de entorno.

🚨 Haz las siguientes sustituciones en este comando:
- El `UBUNTU_USERNAME` por el usuario que escogiste durante la configuración de **Ubuntu**
- El `GITHUB_NICKNAME` por tu nickname de **GitHub**
- El `SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json` por el nombre del archivo json de tu cuenta de servicio.

``` bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/home/UBUNTU_USERNAME/code/GITHUB_NICKNAME/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.aliases
```
