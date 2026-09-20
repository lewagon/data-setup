
# Instrucciones de configuración

A continuación encontrarás las instrucciones para configurar tu ordenador para el [bootcamp de Data Science & AI de Le Wagon](https://www.lewagon.com/data-science-course).

Por favor, **léelas detenidamente y ejecuta todos los comandos en el siguiente orden**.

Esta configuración no es un ejercicio; su único propósito es preparar tu ordenador de forma estandarizada. No experimentes ni pidas ayuda a un LLM. Si te atascas, simplemente pide ayuda a un profesor :raising_hand:

Empecemos :rocket:


## Cuenta GitHub

¿Ya tienes una cuenta GitHub? Si no es el caso, [ábrela ya](https://github.com/join).

:point_right: **[Sube una foto](https://github.com/settings/profile)** y escribe tu nombre correctamente en tu cuenta GitHub. Esto es importante porque nosotros usaremos un tablero de comando interno con tu avatar. Por favor hazlo **ahora** antes de dar un paso más en esta guía.

![Foto GitHub](https://github.com/lewagon/setup/blob/simplify-conso/images/github_picture.png)

:point_right: **[Habilita la Autenticación de Dos Factores (2FA)](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-text-messages)**. GitHub te enviará mensajes de texto con un código cuando intentes iniciar sesión. Esto es importante para la seguridad y también pronto será necesario para contribuir código en GitHub.


## Verifica tu procesador

De acuerdo con nuestros requisitos de computadoras portátiles, esta configuración solo es compatible con arquitecturas de Apple silicon. **La configuración no funciona en computadoras Mac con procesadores Intel.**

Si compraste tu Mac después de finales de 2020, es probable que cuente con un chip Apple silicon.

Para verificar tu procesador, haz clic en el ícono de Apple en la esquina superior izquierda de tu pantalla y selecciona *"Acerca de esta Mac"*. Si el campo *"Chip"* (o *"Procesador"*) indica *"Apple"*, tu equipo es compatible. Si dice *"Intel"*, tu Mac no es compatible.


## Cómo cerrar aplicaciones en una Mac correctamente

Hacer clic en círculo rojo en la esquina superior izquierda de la ventana de la aplicación en Mac **no la termina el proceso**, solo cierra una ventana activa. Hay dos alternativas para cerrar la aplicación _realmente_. Puedes presionar `Cmd + Q` cuando la misma está activa. La otra opción es ir a `APP_NAME` -> `Quit` en la barra del menú.

![Cerrar la Terminal en macOS](https://github.com/lewagon/setup/blob/simplify-conso/images/macos_quit.png)

Durante esta configuración, se te pedirá **cerrar y abrir nuevamente** aplicaciones varias veces. Por favor asegúrate de hacerlo correctamente :pray:

## Herramientas de la Línea de Comando

Abre una nueva terminal, copia y pega el comando siguiente y presiona `Enter`:

```bash
xcode-select --install
```

Si obtienes el mensaje que te mostramos a continuación, puedes ignorar este paso e ir al siguiente.

```bash
# command line tools are already installed, use "Software Update" to install updates
```

Este mensaje significa que las herramientas de la línea de comando ya están instaladas y te pide que uses "Software Update" para instalar las actualizaciones. Si no recibes este mensaje, se abrirá una ventana preguntándote si quieres instalar algún programa: haz clic en "Install" y espera.


![Instalación de xcode-select en macOS](https://github.com/lewagon/setup/blob/simplify-conso/images/macos_xcode_select_install.png)

:heavy_check_mark: Si ves el mensaje "The software was installed", lo que significa que el programa se ha instalado, entonces todo está bien :+1:

:x: Si falla el comando `xcode-select --install` , intenta nuevamente: algunas veces los servidores de Apple se sobrecargan.

:x: Si ves el mensaje "Xcode is not currently available from the Software Update server", debes actualizar el catálogo de actualización de programas:

```bash
sudo softwareupdate --clear-catalog
```

Cuando termines eso, puedes intentar hacer la instalación nuevamente.


## Homebrew

[Homebrew](http://brew.sh/) es un gestionador de paquetes: es un programa que se usa para instalar otros programas desde la línea de comando. ¡Vamos a instalarlo!

Abre la terminal y ejecuta lo siguiente:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Te pedirá que confirmes (presionando `Enter`) y también te pedirá la **contraseña de tu cuenta de usuario macOS** (la que usas para [iniciar sesión](https://support.apple.com/en-gb/HT202860) cuando reinicias tu Macbook).

:warning: Cuando escribas tu contraseña no verás nada en la pantalla. **Esto es normal**. Es una herramienta de seguridad para ocultar tanto el contenido de tu contraseña como su longitud. Simplemente escribe tu contraseña y presiona `Enter` al terminar.

Si ya tienes Homebrew instalado, el sistema te lo dirá y puedes continuar.

Una vez que Homebrew haya terminado de instalarse, ejecuta estos dos comandos para agregarlo a tu `PATH`:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Asegúrate de tener la última versión:

```bash
brew update
```

Luego, instala algunos programas útiles (puedes copiar y pegar todas las líneas de código al mismo tiempo):

```bash
brew upgrade git         || brew install -y git
brew upgrade gh          || brew install -y gh
brew upgrade wget        || brew install -y wget
brew upgrade imagemagick || brew install -y imagemagick
brew upgrade jq          || brew install -y jq
brew upgrade openssl     || brew install -y openssl
brew upgrade tree        || brew install -y tree
brew upgrade ncdu        || brew install -y ncdu
brew upgrade xz          || brew install -y xz
brew upgrade readline    || brew install -y readline
brew upgrade direnv      || brew install -y direnv
```


## Visual Studio Code

### Instalación

Instala el editor de texto [Visual Studio Code](https://code.visualstudio.com).

Copia (presionando `Cmd` + `C`) el comando de aquí abajo y luego pégalo en tu terminal (con `Cmd` + `V`):

```bash
brew install --cask visual-studio-code
```

Luego abre VS Code ejecutando el siguiente comando en tu terminal:

```bash
code
```

:heavy_check_mark: Si se acaba de abrir una ventana de VS Code, todo está bien y puedes continuar :+1:

:x: De lo contrario, por favor **contacta a un profesor**.


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

1. Abramos la "Paleta de comandos" de VS Code: escribe `Cmd-Shift-P`.
1. Se abrirá la Paleta de comandos: una pequeña caja de texto en la parte superior de la pantalla. Empieza a escribir `aifeatures` hasta que veas "Chat: Learn How to Hide AI features". Haz clic en ella.
  ![The Command Palette at the top of the screen](https://github.com/lewagon/setup/blob/simplify-conso/images/vscode_find_aifeatures.png)
1. Esto abrirá la configuración y te mostrará la opción "Disable and hide built-in AI features ...". Marca la casilla delante de esa opción.
  ![Check the disable option](https://github.com/lewagon/setup/blob/simplify-conso/images/vscode_disable_aifeatures.png)

Más adelante, si quieres **volver a habilitar** las funciones de IA, puedes seguir las mismas instrucciones para desmarcar la casilla.


## Oh-my-zsh

Instalemos el plugin `zsh` [Oh My Zsh](https://ohmyz.sh/).

Ejecuta este comando en la terminal:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Si te preguntan "Do you want to change your default shell to zsh?", presiona `Y`

Cuando termines, tu terminal debería lucir así:

![La terminal de Ubuntu con OhMyZsh](https://github.com/lewagon/setup/blob/simplify-conso/images/oh_my_zsh.png)

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

### Hacer un fork de los dotfiles

Para personalizar esta configuración, tendrás que hacer un **fork** del repositorio en tu propia cuenta de Github.

Al hacer un **fork**, se crea una copia del repositorio en tu cuenta (`your_github_username/dotfiles`), que luego podrás modificar con tu información personal, como tu nombre.

<details>
<summary>❗ <strong>Si</strong> ya hiciste otro bootcamp de Le Wagon (<strong>Desarrollo Web, Desarrollo de Software con IA, Análisis de Datos, Ciencia de Datos e IA</strong>), abre esto primero ❗
</summary>

Es posible que tengas una versión anterior de los dotfiles de Le Wagon. Podrían ser incompatibles con la configuración actual.


**Abre un ticket** con un TA y haz una de las siguientes cosas:
- Compara tus dotfiles existentes con los [dotfiles 🔗](https://github.com/lewagon/dotfiles) actuales de Le Wagon, especialmente `.zshrc`, `.zprofile` y `settings.json`. Si no hay ninguna diferencia significativa aparte de tu nombre y correo electrónico, continúa con la configuración.
- Si no te importa perder tus dotfiles existentes (recomendado):
    - Elimina tu repositorio de dotfiles existente en GitHub y continúa con la configuración.
    - Elimina el repositorio local: `rm -rf ~/code/<your_github_username>/dotifles`.
- Si no quieres perder tus dotfiles existentes, recomendamos trabajar con ramas:
    - En tu **portátil**, o donde tengas una copia **local** de **tu versión existente de los dotfiles**.
    - Crea una rama de tu configuración existente de dotfiles (`git checkout -b old-setup`) y súbela a GitHub: `git push origin old-setup`.
    - Vuelve a `master`: `git checkout master`.
    - En la rama local `master`, ejecuta `git pull upstream master`, resuelve los conflictos, ejecuta `git commit -m "merged"` y `git push origin master`. Es importante que aceptes los cambios entrantes en los archivos `.zshrc`, `.zprofile` y `settings.json`.
    - Continúa con la configuración.

</details>

<br>

Ejecuta el siguiente comando:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

✔️ Deberías ver tu nombre de usuario de Github impreso.

❌ Si no es así, detente aquí y pide ayuda. Puede haber un problema con el paso anterior (`gh auth`).

Es hora de hacer un fork del repositorio y clonarlo en tu ordenador:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

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

:point_up: Se te pedirá (**prompt**) tu nombre (`Nombre Apellido`) y tu correo electrónico.

:warning: **Debes** introducir uno de los correos electrónicos indicados arriba mediante el comando anterior `gh api ...`. Si no lo haces, Kitt no podrá realizar el seguimiento de tu progreso.

💡 Selecciona la dirección `...@users.noreply.github.com` si no quieres que tu correo electrónico aparezca en repositorios públicos a los que contribuyas.


## direnv

[direnv](https://direnv.net/) es una extensión del shell. Facilita trabajar con variables de entorno por proyecto, lo cual será útil para customizar el comportamiento de tu código.


``` bash
brew install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```



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
/Users/your-username/.lewagon/venvs/lewagon/bin/python3
```


Si no lo hace, ¡consulta con un TA! No continúes con el siguiente paso hasta que hayas resuelto esto.


### Instalar dependencias

Python es genial para datos, porque la comunidad ha desarrollado una enorme cantidad de paquetes que podemos reutilizar.

Instalemos los más comunes:


``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_silicon.txt
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

Docker es una plataforma abierta para el desarrollo, entrega y ejecución de aplicaciones.

_Si ya tienes Docker instalado en tu máquina, por favor actualízalo con la versión más reciente_

### Instalación de Docker

Ve a la página web de [Docker](https://docs.docker.com/get-docker/) y selecciona tu sistema operativo:

![](images/docker.png)

Luego sigue las instrucciones de configuración. Vas a instalar una aplicación de escritorio.

Cuando termines con eso, inicia Docker y verifica que funcione correctamente:

```bash
docker info
```

Deberías obtener lo siguiente:

![](images/docker_info.png)


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



## CLI de `gcloud`

Antes de configurar nuestra cuenta Google Cloud Platform vamos a configurar el CLI de `gcloud` (una interfaz de línea de comando para Google Cloud Platform). Ejecuta el siguiente código y sigue las indicaciones de la terminal para actualizar tu $PATH y habilitar la finalización del comando del shell para el archivo `.zshrc`:

```bash
brew install --cask google-cloud-sdk
```

Luego podrás ejecutar lo siguiente:

```bash
$(brew --prefix)/share/google-cloud-sdk/install.sh
```

<details>
  <summary>¿Recibes un error <code>no such file or directory</code>?</summary>

  Prueba esto:

```bash
$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh
```

Si eso no funciona, contacta a un TA.

</details>


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

[Descarga la aplicación Slack](https://itunes.apple.com/fr/app/slack/id803453959?mt=12) e instálala.

:warning: Si ya estás usando Slack en tu navegador, por favor descarga e instala  **la aplicación de escritorio** la cual tiene todas las funciones.


### Parámetros

Abre la aplicación e inicia sesión en `lewagon-alumni`.

Asegúrate de **subir una foto para tu perfil** :point_down:

![Cómo subir una foto de perfil en Slack](https://github.com/lewagon/setup/blob/simplify-conso/images/slack_profile_picture.gif)

La idea es tener Slack abierto todo el día para compartir enlaces útiles / pedir ayuda / decidir dónde almorzar / etc.

Para asegurarte de que todo lo relacionado a videollamadas funcione bien, prueba tu cámara y tu micrófono:
- Abre la aplicación Slack
- Haz clic en tu foto de perfil en la esquina superior derecha
- Selecciona "Preferencias" en el menú.
- Haz clic en "Audio y vídeo" en la columna de la izquierda.
- Debajo de "Solución de problemas", haz clic en "Ejecutar una prueba de audio, vídeo y pantalla compartida". La prueba se abrirá en una nueva ventana.
- Comprueba que tus dispositivos preferidos de altavoz, micrófono y cámara aparecen en los menús desplegables y haz clic en "Iniciar prueba"
- Haz clic en el botón verde "Start test"

![Chequea el micrófono y la cámara con Slack](https://github.com/lewagon/setup/blob/simplify-conso/images/slack_call_test.png)

:heavy_check_mark: Cuando termine el test deberías ver mensajes de "Succeed" en verde por lo menos para tu micrófono y tu cámara. :+1:

:x: Si no es el caso, **contacta a un profesor**.

¡También puedes instalar la aplicación Slack en tu smartphone e iniciar sesión en `lewagon-alumni`!


## Parámetros de macOS

### Seguridad

Es imperativo proteger tu sesión con una contraseña. Si todavía no es el caso, ve a ` > System Settings... > Users & Groups` y cambia la contraseña de tu computadora. Luego ve a ` > System Settings... > Lock Screen`. Configura el sistema para que pida la contraseña cada `5 seconds` después de regresar de la opción suspender y cuando se active el protector de pantalla.

También puedes ir a ` > System Settings... > Desktop & Dock` y hacer clic en el botón `Hot Corners...` abajo a la izquierda. Selecciona la opción donde al hacer clic en la esquina inferior derecha se active el protector de pantalla. De esa manera al dejar tu escritorio podrás bloquear tu pantalla rápidamente poniendo el cursor del ratón en la esquina inferior derecha. En 5 segundos tu Macbook se bloqueará y te pedirá la contraseña para volver a tu sesión.

### Teclado

A medida que te vayas convirtiendo en programador, entenderás que pierdes tiempo cuando quitas las manos del teclado para usar otra herramienta. Por esa razón es importante aprender a minimizar el uso del trackpad o del ratón. Aquí te mostramos algunos trucos para que lo hagas en macOS.

#### Velocidad del teclado

Ve a ` > System Settings... > Keyboard`. Coloca a `Key repeat rate` en la posición más rápida (a la derecha) y a `Delay until repeat` en la posición más corta (a la derecha).

#### macOS para hackers

[Lee este script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) y selecciona algunas cosas que creas que serán útiles para ti. Por ejemplo, puedes escribir lo siguiente en la terminal:

```bash
# Expanding the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save screenshots to the Desktop (or elsewhere)
defaults write com.apple.screencapture location "${HOME}/Desktop"

# etc..
```

### Anclaje de aplicaciones a tu dock

Usarás frecuentemente casi todas las aplicaciones que has instalado hoy. ¡Anclémoslas a tu dock para que estén a solo un clic de ti!

Para ello, inicia la aplicación. Haz clic derecho en el ícono de la barra de tareas para hacer que aparezca el menú contextual (también llamado emergente) y selecciona "Options" y después "Keep in Dock".

![Cómo anclar una aplicación a la barra de tareas en macOS](https://github.com/lewagon/setup/blob/simplify-conso/images/macos_dock.png)

Ancla lo siguiente:
- Tu terminal
- Tu explorador de archivos
- VS Code
- Tu navegador de Internet
- Slack


## Kata (Extra)

Si has terminado la configuración, te pedimos que preguntes si alguien necesita ayuda con la suya (macOS, Linux o Windows). Las primeras clases son a las 2pm. Hablaremos de la configuración que acabas de hacer y de Kitt.

Si no tienes mucha experiencia con `git` y GitHub, por favor [ve nuevamente el video de este workshop](https://www.youtube.com/watch?v=Z9fIBT2NBGY) (puedes verlo a `1.25` de velocidad).

Si aún te queda tiempo, puedes esperar trabajar en este [Kata de Tic-Tac-Toe](https://www.codewars.com/kata/5b817c2a0ce070ace8002be0/python) mientras esperas la primera clase.


