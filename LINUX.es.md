
# Instrucciones de configuración

A continuación encontrarás las instrucciones para configurar tu ordenador para el [bootcamp de Data Science & AI de Le Wagon](https://www.lewagon.com/data-science-course).

Por favor, **léelas detenidamente y ejecuta todos los comandos en el siguiente orden**.

Esta configuración no es un ejercicio; su único propósito es preparar tu ordenador de forma estandarizada. No experimentes ni pidas ayuda a un LLM. Si te atascas, simplemente pide ayuda a un profesor :raising_hand:

Empecemos :rocket:


## Cuenta GitHub

¿Ya tienes una cuenta GitHub? Si no es el caso, [ábrela ya](https://github.com/join).

:point_right: **[Sube una foto](https://github.com/settings/profile)** y escribe tu nombre correctamente en tu cuenta GitHub. Esto es importante porque nosotros usaremos un tablero de comando interno con tu avatar. Por favor hazlo **ahora** antes de dar un paso más en esta guía.

![Foto GitHub](https://github.com/lewagon/setup/blob/master/images/github_picture.png)

:point_right: **[Habilita la Autenticación de Dos Factores (2FA)](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-text-messages)**. GitHub te enviará mensajes de texto con un código cuando intentes iniciar sesión. Esto es importante para la seguridad y también pronto será necesario para contribuir código en GitHub.


## Visual Studio Code

### Instalación

Instala el editor de texto [Visual Studio Code](https://code.visualstudio.com).

Copia (presionando `Cmd` + `C`) el comando de aquí abajo y luego pégalo en tu terminal (`Ctrl` + `Shift` + `v`):

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code
```

Escribe tu contraseña cuando estos comandos te la pidan.

:warning: Cuando escribas tu contraseña no verás nada en la pantalla. **Esto es normal**. Es una herramienta de seguridad para ocultar tanto el contenido de tu contraseña como su longitud. Simplemente escribe tu contraseña y presiona `Enter` al terminar.

### Abrir desde la terminal

Ahora abre VS Code desde **la terminal**:

```bash
code
```

:heavy_check_mark: Si se acaba de abrir una ventana de VS Code, entonces todo está bien :+1:

:x: Si no es el caso, por favor **pídele ayuda a un profesor**.


## Extensiones de VS Code

### Instalación

Instala algunas extensiones útiles para VS Code.

```bash
code --install-extension ms-vscode.sublime-keybindings
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-python.python
code --install-extension KevinRose.vsc-python-indent
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension alexcvzz.vscode-sqlite
```

Aquí está la lista de las extensiones que estás instalando:
- [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- [SQLite](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)


### Funciones de IA en VS Code

VS Code incluye muchas y potentes **funciones de IA**, que son una gran herramienta una vez que ya sabes programar.

Dicho esto, depender de la IA demasiado pronto puede ocultar conceptos importantes y dificultar la comprensión de la depuración. Una vez que estés cómodo con los fundamentos, sabrás cuándo y cómo usar la IA de forma eficaz —sin dejar que haga el trabajo por ti.

Para el inicio del bootcamp, desactivaremos estas funciones. Llegado el momento apropiado en el curso, las volveremos a habilitar para que puedas utilizarlas bien.

En **VS Code**:

1. Abramos la "Paleta de comandos" de VS Code: escribe `Ctrl-Shift-P`.
1. Se abrirá la Paleta de comandos: una pequeña caja de texto en la parte superior de la pantalla. Empieza a escribir `aifeatures` hasta que veas "Chat: Learn How to Hide AI features". Haz clic en ella.
  ![The Command Palette at the top of the screen](https://github.com/lewagon/setup/blob/master/images/vscode_find_aifeatures.png)
1. Esto abrirá la configuración y te mostrará la opción "Disable and hide built-in AI features ...". Marca la casilla delante de esa opción.
  ![Check the disable option](https://github.com/lewagon/setup/blob/master/images/vscode_disable_aifeatures.png)

Más adelante, si quieres **volver a habilitar** las funciones de IA, puedes seguir las mismas instrucciones para desmarcar la casilla.


## Herramientas de línea de comando

### Comprueba la configuración regional (locale)

La "locale" es un mecanismo que permite adaptar los programas a su idioma y país.

Comprobemos que la configuración regional por defecto es el inglés:

```bash
locale
```

Si la salida no contiene `LANG=en_US.UTF-8`, ejecute el siguiente comando en un Ubuntu terminal para instalar la locale inglesa:

```bash
sudo locale-gen en_US.UTF-8
```

Si después, recibes una advertencia (`bash: warning: setlocale: LC_ALL: cannot change locale (en_US.utf-8)`) en tu terminal, por favor haz lo siguiente:

<details>
  <summary>Generar la configuración regional<>/summary>

Por favor, ejecuta estas líneas en tu terminal.

```bash
sudo update-locale LANG=en_US.UTF8
sudo apt-get update
sudo apt-get install language-pack-en language-pack-en-base manpages
```
</details>

### Zsh & Git

En lugar de usar el `bash` [shell](https://en.wikipedia.org/wiki/Shell_(computing)) predeterminado, usaremos `zsh`.

También utilizaremos [`git`](https://git-scm.com/), un programa de línea de comando para control de versiones.

Vamos a instalarlos, junto con otros programas útiles:
- Abre una **terminal de Ubuntu**
- Copia y pega los siguientes comandos:

```bash
sudo apt update
```

```bash
sudo apt install -y curl git imagemagick jq unzip vim zsh tree direnv
```

Estos comandos te pedirán tu contraseña: escríbela.

:warning: Cuando escribas tu contraseña no verás nada en la pantalla. **Esto es normal**. Es una herramienta de seguridad para ocultar tanto el contenido de tu contraseña como su longitud. Simplemente escribe tu contraseña y presiona `Enter` al terminar.

### Instalación de la CLI de GitHub

Instalemos la [CLI oficial de GitHub](https://cli.github.com) (Interfaz de Línea de Comando). Es un programa que se usa para interactuar con tu cuenta GitHub por medio de la línea de comando.

En tu terminal, copia y pega los siguientes comandos y escribe tu contraseña si te la piden:

```bash
sudo apt remove -y gitsome # gh command can conflict with gitsome if already installed
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install -y gh
```

Ejecuta el comando que te mostramos a continuación para verificar que `gh` se haya instalado correctamente en tu máquina:

```bash
gh --version
```

:heavy_check_mark: Si ves esta versión `gh version X.Y.Z (YYYY-MM-DD)`, puedes continuar trabajando :+1:

:x: Si no es el caso, por favor **contacta a un profesor**


## Oh-my-zsh

Instalemos el plugin `zsh` [Oh My Zsh](https://ohmyz.sh/).

Ejecuta este comando en la terminal:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Si te preguntan "Do you want to change your default shell to zsh?", presiona `Y`

Cuando termines, tu terminal debería lucir así:

![La terminal de Ubuntu con OhMyZsh](https://github.com/lewagon/setup/blob/master/images/oh_my_zsh.png)

:heavy_check_mark: Si es el caso, puedes continuar :+1:

:x: Si no, por favor **pídele ayuda a un profesor**.


## GitHub CLI

CLI es una abreviación de [Command-line Interface](https://en.wikipedia.org/wiki/Command-line_interface) que significa interfaz de línea de comando.

En esta sección usaremos [GitHub CLI](https://cli.github.com/) para interactuar directamente con GitHub desde la terminal.

Usaremos la GitHub CLI (`gh`) para conectarnos a GitHub utilizando *SSH*, un protocolo para iniciar la sesión utilizando claves SSH en lugar de la famosa pareja nombre de usuario y contraseña.

Ya debería haberse instalado en tu computadora con los comandos que ejecutaste anteriormente.

Lo primero que hay que hacer para **iniciar sesión** es copiar y pegar el comando siguiente en tu terminal:

:warning: **NO edites el `email`** — Aunque `user:email` parezca un marcador de posición para tu dirección de correo real, no lo es — no lo reemplaces.

```bash
gh auth login -s 'user:email' -w --git-protocol ssh
```

`gh` le hará algunas preguntas:

- `Generate a new SSH key to add to your GitHub account?` Presiona `Enter` para pedirle a gh que genere las claves SSH por ti.

  Si ya tienes claves SSH, verás en su lugar `Upload your SSH public key to your GitHub account?`Con las flechas, selecciona la ruta de tu archivo de clave pública y pulsa `Intro`.

- `Enter a passphrase for your new SSH key (Optional)`:
  - **PARA LA MAYORÍA DE LOS ESTUDIANTES:** Simplemente presiona `Enter` para omitir. No necesitas una contraseña para el bootcamp y te la pediría cada vez que uses la clave. Sin embargo, hay un riesgo de que si alguien roba tu computadora, pueda subir código a GitHub.
  - **SI LA SEGURIDAD ES MUY IMPORTANTE PARA TI:** Escribe una contraseña de tu elección y presiona `Enter`. Es _muy_ importante que si introduces una contraseña, la anotes en algún lugar inmediatamente y no la pierdas ni la olvides. Tendrás que introducirla con frecuencia.

- `Title for your SSH key`. Puede dejarlo en la propuesta "GitHub CLI", presiona `Enter`.

Obtendrás el siguiente resultado:

```bash
! First copy your one-time code: 0EF9-D015
- Press Enter to open github.com in your browser...
```

Selecciona y copia el código (`0EF9-D015` en el ejemplo) y luego presiona `Enter`.

Tu navegador se abrirá y te pedirá que autorices GitHub CLI para usar tu cuenta GitHub. Acepta y espera un poco.

Regresa a la terminal, presiona `Enter` nuevamente y listo. Eso es todo.

Para verificar que están conectado correctamente, escribe lo siguiente:

```bash
gh auth status
```

:heavy_check_mark: Si obtienes este mensaje: `Logged in to github.com as <YOUR USERNAME> `, significa que todo está bien :+1:

:x: De lo contrario, **contacta a un profesor**.


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


## Configuración de Google Cloud Platform

[Google Cloud](https://cloud.google.com/) es una solución en la nube que utilizarás para desplegar tus productos basados en Machine Learning en producción.

🚨 Si eres estudiante del **Part-Time Bootcamp**, ¡OMITE ESTA SECCIÓN POR AHORA! **Google Cloud** ofrece 300 $ de crédito gratuito durante 3 meses. No querrás activar tu cuenta de Google Cloud demasiado pronto 🙅‍♂️



### Configuración del proyecto

- Ve a [Google Cloud](https://console.cloud.google.com/) y crea una cuenta si aún no tienes una
- En Cloud Console, en la lista de proyectos, selecciona o crea un proyecto de Cloud

⚠️ **Importante:** Al crear un proyecto nuevo, verás un campo **Organization**. Déjalo como **"No organization"**. No selecciones ni crees una organización. Elegir una organización aplica restricciones que pueden impedirte utilizar los servicios de Google Cloud durante el bootcamp.

![](images/gcp-create-project.png)

- Asígnale un nombre, por ejemplo, `Wagon Bootcamp`
- Observa el `ID` que se crea automáticamente para el proyecto, por ejemplo, `wagon-bootcamp-123456`

![](images/gcp_project.png)

ℹ️ Anota el **Project ID** (por ejemplo, `wagon-bootcamp-123456`), que **no** es lo mismo que el nombre del proyecto que elegiste (por ejemplo, `Wagon Bootcamp`). Necesitarás el ID más adelante al ejecutar comandos en la terminal, pero no te preocupes: siempre puedes encontrarlo en Google Cloud.

### Idioma de la cuenta

Para facilitar el seguimiento de las instrucciones durante el bootcamp, abre las preferencias de tu cuenta de Google Cloud:

[https://myaccount.google.com/language](https://myaccount.google.com/language)

Si el *idioma preferido* no es:

- **English**
- **United States**

Entonces cambia el idioma a inglés:

- Haz clic en el icono del lápiz de edición
- Selecciona **English**
- Selecciona **United States**
- Haz clic en **Select**

### Cuenta de facturación

Ahora vincularás tu cuenta a tu tarjeta de crédito. Este paso es obligatorio; de lo contrario, no podrás utilizar los servicios proporcionados por Google Cloud. No te preocupes: podrás utilizar la mayoría de los servicios de Google Cloud mediante créditos gratuitos durante el bootcamp.

⚠️ En algunos casos, Google puede hacer un cargo en tu tarjeta (de unos 10 €) para verificar que es válida. Desafortunadamente, no se reembolsará una vez aprobada, pero se añadirá como crédito en Google Cloud que podrás utilizar cuando hayas usado o hayan caducado tus créditos gratuitos.

![](images/gcp-billing.png)

- Haz clic en **Billing**
- Haz clic en **MANAGE BILLING ACCOUNTS**
- Haz clic en **ADD BILLING ACCOUNT**
- Ponle un nombre a tu cuenta de facturación, por ejemplo, `My Billing Account`
- Haz clic en "I have read..." y acepta las condiciones del servicio
- Haz clic en **CONTINUE**
- Selecciona el tipo de cuenta: `Individual`
- Introduce tu nombre y dirección

Deberías ver que tienes un crédito gratuito de "$300 credits over the next 90 days".

- Haz clic en los datos de la tarjeta
- Introduce los datos de tu tarjeta de crédito
- Haz clic en **START MY FREE TRIAL**

Una vez hecho esto, verifica que tu cuenta de facturación esté vinculada a tu proyecto de Google Cloud.

- Selecciona tu proyecto
- Ve a **Billing**
- Selecciona **LINK A BILLING ACCOUNT**
- Selecciona `My Billing Account`
- Haz clic en **SET ACCOUNT**

Ahora deberías ver:

```bash
Free trial status: $300 credit and 91 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.
```

<details>
  <summary>👉 Si no tienes una tarjeta de crédito 👈</summary>

Si no tienes una tarjeta de crédito, una alternativa es crear una cuenta de **Revolut**.
Revolut es una aplicación financiera que te permite crear una tarjeta de crédito virtual vinculada a tu cuenta de facturación del teléfono móvil.

Omite este paso si tienes una tarjeta de crédito y la utilizas para la configuración.

Descarga la aplicación Revolut o visita [revolut](https://www.revolut.com/a-radically-better-account) y sigue los pasos para descargar la aplicación (introduce tu número de teléfono móvil y haz clic en Get Started).

- Abre la aplicación Revolut
- Introduce tu número de teléfono móvil
- Introduce el código de verificación recibido por SMS
- La aplicación te pedirá tu país, dirección, nombre y apellidos, fecha de nacimiento y dirección de correo electrónico
- La aplicación también te pedirá un selfie y tu profesión
- La aplicación requerirá una foto de tu documento de identidad o pasaporte

Una vez hecho esto, selecciona el plan estándar (gratuito). No es necesario añadir la tarjeta a Apple Pay, solicitar el envío de una tarjeta física ni añadir dinero.

Ahora tienes una tarjeta virtual que utilizaremos para configurar Google Cloud.

En la vista principal de la aplicación Revolut

- Haz clic en Ready to use
- Haz clic en la tarjeta
- Haz clic en Show card details
- Anota los datos de la tarjeta de crédito virtual y utilízalos para continuar con la configuración de Google Cloud

</details>

<details>
  <summary>👉 Si recibes un correo de Google que dice "Urgent: your billing account XXXXXX-XXXXXX-XXXXXX has been suspended" 👈</summary>

Esto puede ocurrir especialmente si acabas de configurar una cuenta de Revolut.

- Haz clic en PROCEED TO VERIFICATION
- Se te pedirá que envíes una foto de tu tarjeta de crédito (solo los últimos 4 dígitos, sin ninguna otra información)
- Si utilizaste **Revolut**, puedes enviar una captura de pantalla de tu tarjeta de crédito virtual (no olvides eliminar la fecha de caducidad de la captura)
- Explica que estás asistiendo al bootcamp de Le Wagon, que no tienes una tarjeta de crédito y que acabas de crear una cuenta de Revolut para configurar Google Cloud para el bootcamp mediante una tarjeta de crédito virtual

Puedes recibir una validación o solicitudes de más información en un plazo de 30 minutos.

Una vez completada la verificación, deberías recibir un correo que indique: "Your Google Cloud Platform billing account XXXXXX-XXXXXX-XXXXXX has been fully reinstated and is ready to use.".

</details>

### Activación de los servicios de Google Cloud

- Asegúrate de que la facturación esté activada para tu proyecto de Google Cloud

ℹ️ Tienes un **crédito de 300 $** para utilizar en recursos de Google Cloud, más que suficiente para el bootcamp.

- [Activa las API de BigQuery y Compute Engine](https://console.cloud.google.com/flows/enableapi?apiid=bigquery,compute) (Este paso puede tardar unos minutos)

¡Eso es todo para la configuración en el navegador! La configuración de la terminal aparece más adelante en esta guía.


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



## Kitt

Deberías haber recibido un correo electrónico de Le Wagon invitándote a registrarte en [Kitt](https://kitt.lewagon.com) (nuestra plataforma de aprendizaje).

Entonces deberías recibir una invitación adicional de Slack, invitándote a la comunidad de los alumni de Le Wagon en slack (donde podrás chatear con tus compañeros y todos los demás alumni). Haz clic en **Join** y completa la información que te piden.

Si no lo has recibido, por favor contacta a tu equipo de enseñanza.


## Slack

[Slack](https://slack.com/) es una plataforma de comunicación popular en la industria tech.

### Instalación

[Descarga la aplicación Slack](https://get.slack.help/hc/en-us/articles/212924728-Slack-for-Linux-beta-) e instálala.

:warning: Si ya estás usando Slack en tu navegador, por favor descarga e instala **la aplicación de escritorio** la cual tiene todas las funciones.


### Parámetros

Abre la aplicación e inicia sesión en `lewagon-alumni`.

Asegúrate de **subir una foto para tu perfil** :point_down:

![Cómo subir una foto de perfil en Slack](https://github.com/lewagon/setup/blob/master/images/slack_profile_picture.gif)

La idea es tener Slack abierto todo el día para compartir enlaces útiles / pedir ayuda / decidir dónde almorzar / etc.

Para asegurarte de que todo lo relacionado a videollamadas funcione bien, prueba tu cámara y tu micrófono:
- Abre la aplicación Slack
- Haz clic en tu foto de perfil en la esquina superior derecha
- Selecciona "Preferencias" en el menú.
- Haz clic en "Audio y vídeo" en la columna de la izquierda.
- Debajo de "Solución de problemas", haz clic en "Ejecutar una prueba de audio, vídeo y pantalla compartida". La prueba se abrirá en una nueva ventana.
- Comprueba que tus dispositivos preferidos de altavoz, micrófono y cámara aparecen en los menús desplegables y haz clic en "Iniciar prueba"
- Haz clic en el botón verde "Start test"

![Chequea el micrófono y la cámara con Slack](https://github.com/lewagon/setup/blob/master/images/slack_call_test.png)

:heavy_check_mark: Cuando termine el test deberías ver mensajes de "Succeed" en verde por lo menos para tu micrófono y tu cámara. :+1:

:x: Si no es el caso, **contacta a un profesor**.

¡También puedes instalar la aplicación Slack en tu smartphone e iniciar sesión en `lewagon-alumni`!


## Kata (Extra)

Si has terminado la configuración, te pedimos que preguntes si alguien necesita ayuda con la suya (macOS, Linux o Windows). Las primeras clases son a las 2pm. Hablaremos de la configuración que acabas de hacer y de Kitt.

Si no tienes mucha experiencia con `git` y GitHub, por favor [ve nuevamente el video de este workshop](https://www.youtube.com/watch?v=Z9fIBT2NBGY) (puedes verlo a `1.25` de velocidad).

Si aún te queda tiempo, puedes esperar trabajar en este [Kata de Tic-Tac-Toe](https://www.codewars.com/kata/5b817c2a0ce070ace8002be0/python) mientras esperas la primera clase.


