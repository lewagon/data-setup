
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

$MAC_START
``` bash
brew update && brew upgrade pyenv
```
$MAC_END
$LINUX_START
``` bash
cd $(pyenv root) && git pull
```
$LINUX_END
$WINDOWS_START
``` bash
cd $(pyenv root) && git pull
```
$WINDOWS_END

Instala la versión actual de python:

```bash
pyenv install <PYTHON_VERSION>
```

👉 Asegúrate de que el comando se ejecute completamente y luego **reinicia tu terminal**.

Remueve el ambiente virtual dedicado actual:

```bash
pyenv virtualenv-delete lewagon_current
```

Crea un nuevo ambiente virtual:

```bash
pyenv virtualenv <PYTHON_VERSION> lewagon_current
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
  <PYTHON_VERSION>
  <PYTHON_VERSION>/envs/lewagon_current
  3.7.6
  3.7.6/envs/lewagon
* lewagon_current
  lewagon
```

### Instalación de los paquetes del bootcamp

```bash
pip install -U pip
```

$MAC_START
Si tu computadora usa **Apple Silicon**, expande el párrafo de abajo y léelo. Si no es el caso, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Configuración para Apple Silicon 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_silicon.txt
```
</details>

Si tu computadora usa **Apple Intel**, expande el párrafo de abajo y léelo. Si no es el caso, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Configuración para Apple Intel 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_intel.txt
```
</details>
$MAC_END
$WINDOWS_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
$WINDOWS_END
$LINUX_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
$LINUX_END

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

$MAC_START
Start the Docker app
$MAC_END
$LINUX_START
Start Docker :

``` bash
sudo service docker start
```
$LINUX_END
$WINDOWS_START
Start Docker :

``` bash
sudo service docker start
```
$WINDOWS_END

Verifica que Docker pueda ejecutar la imagen de hello-world:

``` bash
docker run hello-world
```

👉 Asegúrate de que este comando se ejecute completamente

$MAC_START
Stop the Docker app
$MAC_END
$LINUX_START
Stop Docker :

``` bash
sudo service docker stop
```
$LINUX_END
$WINDOWS_START
Stop Docker :

``` bash
sudo service docker stop
```

Si este comando no funciona, reinicia Ubuntu ejecutando el comando siguiente en una ventana PowerShell:

``` bash
wsl --shutdown
```

Si después de eso el comando sigue sin funcionar, intenta reiniciar tu máquina Windows
$WINDOWS_END
