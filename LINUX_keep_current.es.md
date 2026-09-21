
# Cómo mantener tu configuración al día

Esta sección contiene los pasos que tienes que seguir para asegurarte de que tu configuración esté actualizada.

Primero y principal, para trabajar en buenas condiciones, asegúrate de que:
- tienes una conexión internet de alta velocidad
- tu computadora tiene suficiente memoria (8GB) para poder ejecutar tu código eficientemente
- tu computadora tiene suficiente espacio en disco (30GB) para poder trabajar con grandes datasets.

## git

Verifica que git funcione:

``` bash
git --version
```

👉 Deberías obtener algo parecido a esto de aquí abajo que te muestra la versión de git:

``` bash
git version 2.33.0
```

## GitHub

Verifica que tengas acceso a los repositorios GitHub públicos de Le Wagon

``` bash
cd ~/code/<YOUR_GITHUB_NICKNAME>/
git clone git@github.com:lewagon/data-setup data-setup
```

👉 Se debe clonar el repositorio correctamente:

``` bash
Cloning into 'data-setup'...
remote: Enumerating objects: 21, done.
remote: Counting objects: 100% (21/21), done.
remote: Compressing objects: 100% (14/14), done.
Receiving objects: 100% (21/21), done.
Resolving deltas: 100% (6/6), done.
remote: Total 21 (delta 6), reused 16 (delta 1), pack-reused 0
```

👉 Puedes borrar el repositorio clonado

``` bash
rm -Rf data-setup
```

## Verificación de la configuración de pyenv

Verifica que tengas un `~/.zprofile` :

``` bash
cat ~/.zprofile
```

👉 Deberías poder ver las líneas siguientes:

``` bash
# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
type -a pyenv > /dev/null && eval "$(pyenv init --path)"
```

Si el comando no da ningún resultado, crea el archivo `~/.zprofile`:

``` bash
cd
touch .zprofile
```

Agrega las siguientes líneas a tu `~/.zprofile` :

``` bash
# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
type -a pyenv > /dev/null && eval "$(pyenv init --path)"
```

## Creación de un ambiente virtual dedicado

Actualiza pyenv:


``` bash
cd $(pyenv root) && git pull
```


Instala la versión actual de python:

```bash
pyenv install 3.12.9
```

👉 Asegúrate de que el comando se ejecute completamente y luego **reinicia tu terminal**.

Remueve el ambiente virtual dedicado actual:

```bash
pyenv virtualenv-delete lewagon_current
```

Crea un nuevo ambiente virtual:

```bash
pyenv virtualenv 3.12.9 lewagon_current
```

Define el nuevo ambiente virtual como predeterminado:

```bash
pyenv global lewagon_current
```

Ahora deberías poder ver que el nuevo ambiente virtual está activado:

``` bash
pyenv versions
```

👉 Aquí hay una muestra del resultado:

``` bash
  system
  3.12.9
  3.12.9/envs/lewagon_current
  3.7.6
  3.7.6/envs/lewagon
* lewagon_current
  lewagon
```

### Instalación de los paquetes del bootcamp

```bash
pip install -U pip
```


``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```


## GCP

Asegúrate de que el comando `gcloud` esté conectado con el email de tu cuenta Google Cloud Platform:

``` bash
gcloud auth list
```

👉 Esto muestra los emails de tu cuenta GCP:

``` bash
      Credentialed Accounts
ACTIVE  ACCOUNT
*       your.email_address@your.email.provider

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

Verifica el nombre de tu proyecto gcp:

``` bash
gcloud config list
```

👉 Esto muestra tanto el email de tu cuenta GCP como tu proyecto GCP:


``` bash
[core]
account = your.email_address@your.email.provider
disable_usage_reporting = True
project = your-gcp-project-id

Your active configuration is: [default]
```

Verifica que el email creado para la cuenta de servicio permita que tu código se identifique con GCP:

``` bash
gcloud iam service-accounts list
```

👉 Esto muestra el email de la cuenta de servicio en GCP que permite que tu código se identifique con GCP.

``` bash
DISPLAY NAME          EMAIL                                                              DISABLED
your-gcp-project-id   your-service-account@your-service-account.iam.gserviceaccount.com  False
```

Ve a [GCP IAM & Admin / Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts):
- Selecciona tu proyecto
- Haz clic en el email de la cuenta de servicio
- Ve a `PERMISSIONS`
- Asegúrate de que el email de la cuenta de servicio tenga un `Role` configurado como `Owner`

Verifica que hayas configurado tu máquina para que permita que tu código se identifique con GCP. El archivo de claves json de las credenciales de la cuenta de servicio debe estar conectado al email de la cuenta de servicio correcto:

``` bash
cat $GOOGLE_APPLICATION_CREDENTIALS
```

👉 Esto muestra el contenido de la clave json de las credenciales de la cuenta de servicio:

``` bash
{
  "type": "service_account",
  "project_id": "your-gcp-project-id",
  "private_key_id": "a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4a2d4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInMIInM=\n-----END PRIVATE KEY-----\n",
  "client_email": "your-service-account@your-service-account.iam.gserviceaccount.com",
  "client_id": "105410541054105410541",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-service-account.iam.gserviceaccount.com"
}
```

Asegúrate de que el archivo contenga:
- el id el proyecto adecuado: your-gcp-project-id
- el email de la cuenta de servicio adecuado: your-service-account@your-service-account.iam.gserviceaccount.com

👉 Si esto no muestra nada o si el email dentro del archivo no es el de tu cuenta de servicio, regresa al setup.

Asegúrate de que Docker reconozca a los recursos GCP:

``` bash
gcloud auth configure-docker
```

👉 Esto muestra los prefijos de los nombres de las imágenes que Docker reconoce como destinados a GCP

``` bash
{
  "credHelpers": {
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud",
    "marketplace.gcr.io": "gcloud",
    "gcr.io": "gcloud"
  }
}
```

## Docker


Start Docker :

``` bash
sudo service docker start
```


Verifica que Docker pueda ejecutar la imagen de hello-world:

``` bash
docker run hello-world
```

👉 Asegúrate de que este comando se ejecute completamente


Stop Docker :

``` bash
sudo service docker stop
```



## Dotfiles

Mejoremos la experiencia de tu máquina instalando los [dotfiles 🔗](https://github.com/lewagon/dotfiles) preconfigurados de Le Wagon. Son archivos de configuración para tu terminal, zsh, git y VS Code.


### Obtener tu nombre de usuario de GitHub

Ejecuta el siguiente comando:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

✔️ Deberías ver tu nombre de usuario de GitHub en la pantalla.

❌ Si no es así, detente aquí y pide ayuda. Puede haber un problema con el paso anterior (`gh auth`).


### Crear un fork de los dotfiles

Para personalizar esta configuración, tendrás que crear un **fork** del repositorio en tu propia cuenta de GitHub.

Crear un **fork** genera una copia del repositorio en tu cuenta (`your_github_username/dotfiles`), que luego podrás modificar con tus datos personales, como tu nombre.

<details>
<summary>❗ <strong>Si ya hiciste otro bootcamp de Le Wagon</strong> (<em>Desarrollo web, Desarrollo de software con IA, Análisis de datos, Ciencia de datos e IA</em>), <strong>abre un ticket con un TA</strong> y abre esta sección para ver las instrucciones ❗
</summary>

Es posible que tengas una versión antigua de los dotfiles de Le Wagon. Podrían ser incompatibles con la configuración actual.


**Junto con un TA**, haz una de las siguientes acciones:

<details>
<summary>Estoy usando <strong>la misma máquina</strong> (o una máquina nueva que ya tiene los dotfiles).</summary>

1. Ve a tu carpeta actual de dotfiles:
   ```bash
   cd ~/code/$GITHUB_USERNAME/dotfiles
   ```

1. Comprueba las diferencias con la versión actual de los dotfiles de Le Wagon:
    ```bash
    git diff upstream/master
    ```

Si no hay diferencias importantes aparte de tu nombre y correo electrónico, continúa con la configuración.

</details>

<details>
<summary>Estoy usando <strong>una máquina nueva</strong> sin los dotfiles.</summary>

1. Ve a GitHub y encuentra tu repositorio de `dotfiles`.

1. Comprueba cuántos commits por detrás y por delante está de `lewagon/dotfiles:master`. Puedes verlo justo encima de la lista de archivos.

1. Haz clic en los enlaces de commits por detrás y por delante, y desplázate hacia abajo para ver las diferencias.

Si no hay diferencias importantes aparte de tu nombre y correo electrónico, continúa con la configuración.

</details>

<details>
<summary>El paso anterior mostró <strong>diferencias importantes</strong>.</summary>

Si estás de acuerdo con perder tus dotfiles actuales (recomendado):

Ten en cuenta que esto eliminará cualquier cambio personal que hayas hecho en la configuración de tu shell, como cargar utilidades adicionales o cambiar su apariencia. Si no recuerdas haber hecho cambios, no debería haber ningún problema.

1. Elimina tu repositorio actual de dotfiles en GitHub.
1. Elimina el repositorio local:
    ```bash
    cd ~/code && rm -rf ~/code/$GITHUB_USERNAME/dotfiles
    ```
1. Continúa con la configuración.

<details>
<summary>Si no quieres perder tus dotfiles actuales, te recomendamos trabajar con ramas. Haz clic para abrir.</summary>

En tu **portátil**, o donde tengas una copia **local** de **tu versión actual de los dotfiles**.

1. Haz commit de tu versión actual de los dotfiles:

    ```bash
    git add .
    git status # Comprueba qué se incluirá en el commit
    git commit -m "Version prior to new setup"
    ```

1. Crea una rama de tu configuración actual de dotfiles y súbela a GitHub:
    
    ```bash
    git checkout -b old-setup
    git push origin old-setup
    ```

1. Vuelve a `master`: `git checkout master`.

1. En tu `master` local, ejecuta `git pull upstream master`.

1. Comprueba que no estés en estado `MERGING`. Si lo estás, resuelve los conflictos.
    
    Es importante que aceptes los cambios entrantes en los archivos `.zshrc`, `.zprofile` y `settings.json`, especialmente todo lo relacionado con `pyenv` y los entornos de Python.

    Si hay demasiados conflictos, usa tu editor de código para reemplazar el contenido de los archivos en conflicto por el de los [dotfiles de Le Wagon](https://www.github.com/lewagon/dotfiles).

    Haz commit de la resolución de conflictos: `git commit --no-edit`

1. Sube tus cambios a GitHub: `git push origin master`.

1. Continúa con la configuración.

</details>

</details>

</details>

<br>

Es hora de crear un fork del repositorio y clonarlo en tu ordenador:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Si aparece la pregunta _"Are you sure you want to continue connecting (yes/no/[fingerprint])?"_, escribe `yes` y pulsa `Enter`.

### Instalar los dotfiles

Ejecuta el instalador de `dotfiles` con:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Comprueba los correos electrónicos registrados en tu cuenta de GitHub. Tendrás que elegir uno en el siguiente paso:

```bash
gh api user/emails | jq -r '.[].email'
```

Ejecuta el instalador de git:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: Se te pedirá tu nombre (`FirstName LastName`) y tu correo electrónico.

:warning: **Debes** introducir uno de los correos que aparecen arriba, obtenidos con el comando `gh api ...`. Si no lo haces, Kitt no podrá realizar un seguimiento de tu progreso.

💡 Selecciona la dirección `...@users.noreply.github.com` si no quieres que tu correo aparezca en repositorios públicos a los que contribuyas.


## Instalar Python y sus dependencias

Tu sistema operativo - macOS, o Ubuntu (nativo, o dentro de WSL) - viene con un "Python del sistema". Esa es una versión de Python de la que depende tu sistema. No vamos a tocar esa. Vamos a hacer una configuración profesional de Python en la que no estropees tu "Python del sistema" y en la que podrás cambiar la versión que quieras usar para cada proyecto en el que trabajes.

Para gestionar diferentes versiones de Python y entornos virtuales (descubrirás qué significa eso durante la clase de configuración), usaremos la herramienta de última generación [`uv` creada por Astral](https://docs.astral.sh/uv/).


### Instalar `uv`

Primero, instalaremos `uv`:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

A continuación, reinicia tu shell ejecutando esto:

```bash
exec zsh
```

### Crear un entorno virtual

A continuación, crearemos un entorno virtual (un entorno aislado con Python y las dependencias del bootcamp):

```bash
uv venv ~/.lewagon/venvs/lewagon --python 3.12.9
```

Ahora que hemos creado este nuevo entorno virtual, reiniciemos nuestro shell para que lo detecte (esto funciona gracias a los `lewagon/dotfiles` que instalamos antes):

```bash
exec zsh
```

Comprobemos que todo ha ido bien. Ejecuta esto:

```bash
which python3
```

Debería devolver esto:


``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```


Si no lo hace, ¡consulta con un TA! No continúes con el siguiente paso hasta que hayas resuelto esto.


### Instalar dependencias

Python es genial para datos, porque la comunidad ha desarrollado una enorme cantidad de paquetes que podemos reutilizar.

Instalemos los más comunes:


``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```



## Configuración de Jupyter Notebook

Dependiendo de tu sistema, necesitamos hacer algunos cambios pequeños en tu configuración de Jupyter.

Ejecuta esto:

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/checks/setup_jupyter.sh)"
```

<details>
<summary>Si tienes curiosidad sobre lo que sucede aquí, haz clic aquí.</summary>

Este script añade una configuración para mejorar la visualización de los [elementos `details`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) en tus notebooks.

Si estás usando Windows WSL, también soluciona otros problemas.


</details>


## Chequeo de la configuración de Python

### Chequeo de Python y packages

Reinicia tu terminal:

```bash
cd ~/code && exec zsh
```

Verifica tu versión de Python con los siguientes comandos:
```bash
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh)" 3.12.9
```

Ahora verifica que puedas iniciar un servidor de notebook en tu máquina:

```bash
jupyter notebook
```

Tu navegador web debería abrir en una ventana `jupyter`:

![jupyter.png](images/jupyter.png)

Haz clic en `New` y, en el menú desplegable, selecciona Python 3 (ipykernel):

![jupyter_new.png](images/jupyter_new.png)

Debería abrirse una pestaña en un nuevo notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

Asegúrate de que estés usando la versión correcta de python en el notebook. Abre una celda y ejecuta lo siguiente:
``` python
import sys; sys.version
```

Debería mostrar `3.12.9` seguido de algunos detalles adicionales. Si no es así, consulta con un TA.

En otra celda, ejecuta:

```python
import pandas as pd
pd.__version___
```

Esto podría tomar algunos minutos en ejecutarse. Debería mostrar un número de versión, `2.2.3`. Si no es así, consulta con un TA.

Puedes cerrar tu navegador web y luego cerrar el servidor jupyter con `CTRL` + `C`.

¡Listo! Ya tienes un virtual env de python completo con todos los paquetes tercerizados que necesitarás en el bootcamp.


## CLI de Google Cloud

Instala la CLI de `gcloud` para comunicar con [Google Cloud Platform](https://cloud.google.com/) a través de la terminal:
```bash
sudo apt-get update && sudo apt-get install ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
```
👉 [Documentación para la instalación](https://cloud.google.com/sdk/docs/install#deb)


### Configurar Cloud SDK

- Autentica la CLI de `gcloud` con la cuenta de Google que utilizaste para GCP

  
  ```bash
  gcloud auth login
  ```
  

- Inicia sesión en tu cuenta de Google en la nueva pestaña que se abrió en tu navegador web

- Muestra tu cuenta activa y comprueba que aparece la dirección de correo electrónico que utilizaste para GCP

  ```bash
  gcloud auth list
  ```

- Establece tu proyecto actual (reemplaza `PROJECT_ID` por el `ID` de tu proyecto, por ejemplo, `wagon-bootcamp-123456`)

  ```bash
  gcloud config set project PROJECT_ID
  ```

- Muestra tu cuenta activa y tu proyecto actual, y comprueba que aparece tu proyecto

  ```bash
  gcloud config list
  ```

- Ahora vamos a configurar las credenciales predeterminadas de la aplicación para que tu código Python pueda acceder a GCP:

  ```bash
  gcloud auth application-default login
  ```

  Esto abrirá una ventana del navegador. Inicia sesión con la misma cuenta de Google que utilizaste para crear tu proyecto de GCP. Tus credenciales se guardarán automáticamente.

- Verifiquemos que tus credenciales predeterminadas de la aplicación funcionan:

  ```bash
  gcloud auth application-default print-access-token
  ```

  Deberías ver una cadena de token larga. Si aparece un error, vuelve a ejecutar `gcloud auth application-default login`.

  <details>
    <summary>Solución de problemas</summary>

  - `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`
    - Asegúrate de que la facturación esté habilitada para tu proyecto de Google Cloud Platform [https://cloud.google.com/billing/docs/how-to/modify-project](https://cloud.google.com/billing/docs/how-to/modify-project)
  </details>

🏁 ¡Has terminado la configuración de GCP!


