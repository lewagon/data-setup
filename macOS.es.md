# Instrucciones para la configuración

Aquí abajo encontrarás las instrucciones para configurar tu computadora para [el curso de Data Science de Le Wagon](https://www.lewagon.com/es/data-science-course/full-time)

Por favor **léelas cuidadosamente y ejecuta todos los comandos en el siguiente orden**. Si tienes algún problema, no dudes en pedirle ayuda a una profesor :raising_hand:

¡Comencemos! :rocket:


## Zoom

Para poder interactuar cuando no estemos en el mismo lugar físico, usaremos [Zoom](https://zoom.us/), una herramienta de videoconferencia.

:warning: Si ya tienes Zoom instalado, por favor asegúrate de que por lo menos tienes versión **5.6**.

Ve a [zoom.us/download](https://zoom.us/download).

Haz clic en el botón **Download** debajo de **Zoom Client**.

Abre el archivo que acabas de descargar para instalar la aplicación.

Abre la aplicación Zoom.

Si ya tienes una cuenta Zoom, inicia sesión con tus credenciales.

Si no, haz clic en el enlace **Sign Up Free**, que significa registrarse gratuitamente:

![Registrarse gratuitamente en Zoom](https://github.com/lewagon/setup/blob/master/images/zoom_sign_up_free.png)

Te redireccionarán a la página de Zoom para que completes un formulario.

Cuando termines, regresa a la aplicación Zoom e inicia sesión usando tus credenciales.

Deberías ver una pantalla como la siguiente:

![Pantalla de inicio de Zoom](https://github.com/lewagon/setup/blob/master/images/zoom_home_screen.png)

Ya puedes cerrar la aplicación Zoom.


## Cuenta GitHub

¿Ya tienes una cuenta GitHub? Si no es el caso, [ábrela ya](https://github.com/join).

:point_right: **[Sube una foto](https://github.com/settings/profile)** y escribe tu nombre correctamente en tu cuenta GitHub. Esto es importante porque nosotros usaremos un tablero de comando interno con tu avatar. Por favor hazlo **ahora** antes de dar un paso más en esta guía.

![Foto GitHub](https://github.com/lewagon/setup/blob/master/images/github_picture.png)


## Chips de Apple Silicon

Si compraste tu computadora a finales del 2020, es posible que tenga un nuevo chip llamado Apple silicon en lugar de un procesador Intel: averigüémoslo.

Abre una nueva ventana de tu terminal desde Applications > Utilities o búscala con [Spotlight](https://support.apple.com/en-gb/HT204014):

![Abre la Terminal en macOS](https://github.com/lewagon/setup/blob/master/images/macos_open_terminal.png)

Copia y pega el siguiente comando en la terminal y presiona `ENTER` para ejecutarlo.

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/setup/master/utils/macos_list_processor_type.sh)"
```

☝️ El resultado de ese comando debería indicarte si tu computadora tiene Apple Silicon.

Si tu computadora usa Apple Silicon, expande el párrafo de abajo y léelo. Si no es el caso, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Configuración para Apple Silicon 👈</summary>

### Desinstalación de Homebrew

Debemos desinstalar homebrew en caso de que una versión nativa ya haya sido instalada.

Ejecuta este comando en la terminal:

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

Si brew no fue instalado, obtendrás el mensaje `brew: command not found!`

### Configuración de la Terminal para Rosetta

Abre la aplicación Finder (o búscala con [Spotlight](https://support.apple.com/en-gb/HT204014)).

Ve a Applications > Utilities.

Duplica la app de la terminal (selecciónala y luego presiona `Cmd` + `C`, `Cmd` + `V`) y cámbiale el nombre a la copia por Terminal Rosetta.

Presiona `Cmd` + `I` en la aplicación Terminal Rosetta y luego selecciona la casilla "Open using Rosetta".

⚠️ De ahora en adelante durante el bootcamp cuando te pidan que abras una Terminal, abrirás la aplicación **Terminal Rosetta**.

</details>


## Cómo cerrar aplicaciones en una Mac correctamente

Hacer clic en círculo rojo en la esquina superior izquierda de la ventana de la aplicación en Mac **no la termina el proceso**, solo cierra una ventana activa. Hay dos alternativas para cerrar la aplicación _realmente_. Puedes presionar `Cmd + Q` cuando la misma está activa. La otra opción es ir a `APP_NAME` -> `Quit` en la barra del menú.

![Cerrar la Terminal en macOS](https://github.com/lewagon/setup/blob/master/images/macos_quit.png)

Durante esta configuración, se te pedirá **cerrar y abrir nuevamente** aplicaciones varias veces. Por favor asegúrate de hacerlo correctamente :pray:

## Herramientas de la Línea de Comando

Abre una nueva terminal, copia y pega el comando siguiente y presiona `ENTER`:

```bash
xcode-select --install
```

Si obtienes el mensaje que te mostramos a continuación, puedes ignorar este paso e ir al siguiente.

```bash
# command line tools are already installed, use "Software Update" to install updates
```

Este mensaje significa que las herramientas de la línea de comando ya están instaladas y te pide que uses "Software Update" para instalar las actualizaciones. Si no recibes este mensaje, se abrirá una ventana preguntándote si quieres instalar algún programa: haz clic en "Install" y espera.


![Instalación de xcode-select en macOS](https://github.com/lewagon/setup/blob/master/images/macos_xcode_select_install.png)

:heavy_check_mark: Si ves el mensaje "The software was installed", lo que significa que el programa se ha instalado, entonces todo está bien :+1:

:x: Si falla el comando `xcode-select --install` , intenta nuevamente: algunas veces los servidores de Apple se sobrecargan.

:x: Si ves el mensaje "Xcode is not currently available from the Software Update server", debes actualizar el catálogo de actualización de programas:

```bash
sudo softwareupdate --clear-catalog
```

Cuando termines eso, puedes intentar hacer la instalación nuevamente.


## Homebrew
### 1. Instálalo:
Si usas Mac tienes que instalar [Homebrew](http://brew.sh/) el cual es un sistema de gestión de paquetes.
Será necesario cuando tengamos que instalar algún programa.
Para instalarlo, abre tu Terminal y ejecuta lo siguiente:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Te pedirá tu confirmación (presiona `Enter`) y tu **contraseña de usuario macOS** (la que usas para [iniciar sesión](https://support.apple.com/en-gb/HT202860) cuando reinicias tu Macbook).
:warning: Cuando escribas tu contraseña en la Terminal, **no** la verás (tampoco verás algo como `*****`). ¡Esto es **normal**! Simplemente escribe tu contraseña y confirma presionando `Enter`.

<details>
  <summary>🛠 Si aparece un <code>Error: Not a valid ref: refs/remotes/origin/master</code> </summary>


El error completo es el siguiente:

``` bash
Error: Not a valid ref: refs/remotes/origin/master :
fatal: ambiguous argument 'refs/remotes/origin/master': unknown revision or path not in the working tree.
```

Ejecuta los siguientes comandos para resolverlo:

``` bash
rm -fr $(brew --repo homebrew/core)  # because you can't `brew untap homebrew/core`
brew tap homebrew/core
```

</details>

Si ya tienes Homebrew, el sistema te lo dirá. No hay problema, así que puedes continuar.

### 2. Asegúrate de tener la versión más reciente:

```bash
brew update
```

<details>
  <summary>🛠 Si aparece un error <code>/usr/local must be writable</code> </summary>

Simplemente ejecuta lo siguiente:

``` bash
sudo chown -R $USER:admin /usr/local
brew update
```

</details>

### 3. Luego instala algunos programas útiles:

Ejecuta lo siguiente en la terminal (puedes copiar / pegar todas las líneas juntas una sola vez).

```bash
brew upgrade git         || brew install git
brew upgrade gh          || brew install gh
brew upgrade wget        || brew install wget
brew upgrade imagemagick || brew install imagemagick
brew upgrade jq          || brew install jq
brew upgrade openssl     || brew install openssl
brew upgrade tree        || brew install tree
brew upgrade ncdu        || brew install ncdu
brew upgrade xz          || brew install xz
brew upgrade readline    || brew install readline
```


## Chrome - tu navegador

Instala el navegador Google Chrome si no lo tienes todavía y configúralo como tu __navegador predeterminado__.

Sigue los pasos en el siguiente enlace :point_right: [Instalación de Google Chrome](https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=es)

__¿Por qué Chrome?__

Lo recomendamos como navegador predeterminado porque es el más compatible con los tests y la ejecución de código. Además trabaja con Google Cloud Platform. Otra opción es Firefox. No recomendamos usar otros navegadores como Opera, Internet Explorer o Safari.


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
```

Aquí está la lista de las extensiones que estás instalando:
- [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)


### Configuración de Live Share

[Visual Studio Live Share](https://visualstudio.microsoft.com/services/live-share/) es una extensión de VS Code que te permite compartir el código en tu editor de texto para debugging y pair-programming: ¡Instalémoslo!

Abre VS Code desde tu terminal escribiendo `code` y presionando `ENTER`.

Haz clic en la pequeña flecha de la parte inferior de la barra de la izquierda:

![VS Code Live Share](https://github.com/lewagon/setup/blob/master/images/vscode_live_share.png)

- Haz clic en el botón "Share". Luego en "GitHub (Inicia sesión usando tu cuenta GitHub)".
- Va a aparecer una ventana emergente pidiéndote que inicies sesión con GitHub: Haz clic en "Allow".
- Te redireccionarán a una página GitHub en tu navegador pidiéndote que autorices Visual Studio Code: Haz clic en "Continue" y luego en "Authorize github".
- Es posible que VS Code muestre más ventanas emergentess: Ciérralas haciendo clic en "OK".

Eso es todo. ¡Ya puedes continuar!



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

Ya debería haberse instalado en tu computadora con los comandos que ejecutaste anteriormente.

Lo primero que hay que hacer para **iniciar sesión** es copiar y pegar el comando siguiente en tu terminal:

:warning: **NO edites el `email`**

```bash
gh auth login -s 'user:email' -w
```

Obtendrás el siguiente resultado:

```bash
! First copy your one-time code: 0EF9-D015
- Press Enter to open github.com in your browser...
```

Selecciona y copia el código (`0EF9-D015` en el ejemplo) y luego presiona `ENTER`.

Tu navegador se abrirá y te pedirá que autorices GitHub CLI para usar tu cuenta GitHub. Acepta y espera un poco.

Regresa a la terminal, presiona `ENTER` nuevamente y listo. Eso es todo.

Para verificar que están conectado correctamente, escribe lo siguiente:

```bash
gh auth status
```

:heavy_check_mark: Si obtienes este mensaje: `Logged in to github.com as <YOUR USERNAME> `, significa que todo está bien :+1:

:x: De lo contrario, **contacta a un profesor**.

Luego ejecuta esta línea de configuración:

```bash
gh config set git_protocol ssh
```


## SSH Key

### Generación

Debemos generar SSH keys las cuales serán utilizadas por GitHub para autenticarte. Piensa que es una manera de iniciar sesión pero diferente a la forma convencional del usuario/contraseña.

:warning: Si ya has generado keys que utilizas actualmente con otros servicios, puedes ignorar este paso.

Abre una terminal y copia y pega este comando, reemplazando el email con el **tuyo** (el que usaste cuando creaste tu cuenta en GitHub).

```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
```

Te pedirá información. Simplemente presiona enter hasta que pida una **passphrase**.

:warning: Cuando te pidan una passphrase, pon algo que quieras y que recuerdes. Es una contraseña para proteger tu private key que está almacenada en tu disco duro.

:warning: Cuando escribas tu passphrase, no verás nada en la pantalla. **Esto es normal**. Es una herramienta de seguridad para ocultar tanto el contenido de tu passphrase como su longitud. Simplemente escribe tu passphrase y presiona `ENTER` al terminar.

### Comunicarle tu public key a GitHub

Ahora le vas a dar tu **public** key a GitHub.

En tu terminal copia y pega el siguiente comando:

```bash
gh auth refresh -s write:public_key
```

Mostrará una código una única vez (####-####) en la pantalla. Cópialo y presiona `ENTER`. Luego pega el código en tu navegador y sigue las instrucciones para **Autorizar a GitHub**.

Vuelve a la terminal. Presiona `ENTER` y ejecuta esto:

```bash
gh ssh-key add ~/.ssh/id_ed25519.pub
```

Eso debería devolver `✓ Public key added to your account`. Si no es el caso, no dudes **en pedirle ayuda a un profesor**.


## Dotfiles

Hay tres opciones, escoge **una**:

<details>
    <summary>
        <strong>Ya hice el bootcamp de Web Development (FullStack) de Le Wagon <em>en la misma laptop</em></strong>
    </summary>

Esto significa que ya has hecho el fork del repositorio GitHub `lewagon/dotfiles` pero tal vez la configuración para el nuevo bootcamp de Data Science no estaba lista en ese momento.

Abre tu terminal y ve a tu proyecto `dotfiles`:

```bash
cd ~/code/<YOUR_GITHUB_NICKNAME>/dotfiles
code . # Open it in VS Code
```

En VS Code, abre  el archivo `zshrc`. Reemplaza su contenido con la [versión más reciente](https://raw.githubusercontent.com/lewagon/dotfiles/master/zshrc) de ese archivo que te suministramos. Luego guárdalo en el disco.

Regresa a la terminal y ejecuta un `git diff` y pídele a un TA que venga y verifique este cambio de configuración. Debería ver cosas de Python y `pyenv`.

Cuando el TA termine de hacer la verificación, haz un commit y haz el push de tus cambios:

```bash
git add zshrc
git commit -m "Update zshrc for Data Science bootcamp"
git push origin master
```

</details>

O


<details>
    <summary>
        <strong>No he hecho el bootcamp de Web Development (FullStack) de Le Wagon</strong>
    </summary>

Los hackers aman mejorar sus shells y sus herramientas. Comenzaremos con una configuración por defecto genial proporcionada por [Le Wagon](http://github.com/lewagon/dotfiles) y almacenada en GitHub. Tu configuración es personal, así que necesitas tu propio repositorio para almacenarla. Primero tienes que hacer el fork del repositorio en tu cuenta GitHub.

:arrow_right: [Haz clic aquí para hacer el **fork**](https://github.com/lewagon/dotfiles/fork) del repositorio `lewagon/dotfiles` a tu cuenta (deberás hacer clic nuevamente en tu foto para confirmar _dónde_ harás el fork).

Hacer un fork significa que crearás un nuevo repositorio en tu cuenta GitHub idéntico al original. Tendrás un nuevo repositorio en tu cuenta GitHub, `your_github_username/dotfiles`. El fork es necesario porque cada uno de ustedes necesitará poner información específica (e.g. tu nombre) en esos archivos.


Abre tu terminal y ejecuta el comando siguiente:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

Deberías ver tu usuario GitHub. Si no es así, **no hagas más nada** y pide ayuda.
Parece que hay un problema con el paso anterior (`gh auth`).

Es hora de hacer el fork del repositorio y clonarlo en tu laptop:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Ejecuta el instalador de `dotfiles`.

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Verifica los emails registrados en tu cuenta GitHub. Deberás seleccionar uno de ellos en el próximo paso:

```bash
gh api user/emails | jq -r '.[].email'
```

Ejecuta el instalador de git:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: Esto te **guiará** con tu nombre (`FirstName LastName`) y con tu email. Cuidado, **debes** poner uno de los emails de la lista de arriba que te suministra el comando `gh api ...` usado anteriormente. Si haces eso, Kitt no podrá hacerle seguimiento a tu progreso.

Ahora **cierra** todas las ventanas de tu terminal que tengas abiertas por favor.
</details>


OR

<details>
    <summary>
        <strong>Ya hice el bootcamp de Web Development (FullStack) de Le Wagon <em>pero tengo una nueva laptop</em></strong>
    </summary>


Abre tu terminal y ejecuta el comando siguiente:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

Deberías ver tu usuario GitHub. Si no es así, **no hagas más nada** y pide ayuda.
Parece que hay un problema con el paso anterior (`gh auth`).

Es hora de hacer el fork del repositorio y clonarlo en tu laptop:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Ejecuta el instalador de `dotfiles`.

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Verifica los emails registrados en tu cuenta GitHub. Deberás seleccionar uno de ellos en el próximo paso:

```bash
gh api user/emails | jq -r '.[].email'
```

Ejecuta el instalador de git:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: Esto te **guiará** con tu nombre (`FirstName LastName`) y con tu email. Cuidado, **debes** poner uno de los emails de la lista de arriba que te suministra el comando `gh api ...` usado anteriormente. Si haces eso, Kitt no podrá hacerle seguimiento a tu progreso.

Ahora **cierra** todas las ventanas de tu terminal que tengas abiertas por favor.
</details>


## Instalación de Python (con [`pyenv`](https://github.com/pyenv/pyenv))

Antes de instalar Python, por favor verifica la versión de tu extensión `xz` con:

```bash
brew info xz
```

Debe ser superior a `5.2.0`, **si no es el caso**, debes ejecutar lo siguiente:

```bash
sudo rm -rf /usr/local/opt/xz
brew upgrade
brew install xz
```

Luego ejecuta:

```bash
brew install readline
```

macOS viene con una versión vieja de Python que no queremos usar. Tal vez ya hayas instalado Anaconda u otro programa para utilizar Python y paquetes de Ciencia de Datos. Si es así, no pasa nada ya que haremos una configuración profesional de Python que te permitirá cambiar de versión cuando quieras al escribir `python` en la terminal.

Primero instala `pyenv` con el siguiente comando en la Terminal:

```bash
brew install pyenv
exec zsh
```

Instala la [última versión estable de Python](https://www.python.org/doc/versions/) aceptada en el currículum de Le Wagon:

```bash
pyenv install 3.8.12
```

Este comando puede tomar un tiempo en ejecutarse. Esto es completamente normal. ¡No dudes en ayudar a los estudiantes que estén sentados cerca de ti!

<details>
  <summary>🛠 Resolución de problemas</summary>

Si aparece un error durante la instalación de Python con `pyenv` y relacionada con `zlib`:

```txt
zipimport.ZipImportError: can't decompress data; zlib not available
```

Instala `zlib` con lo siguiente:

```bash
brew install zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
```

Luego trata de instalar Python nuevamente:

```bash
pyenv install 3.8.12
```

Es posible que aparezca otro error relacionado con `bzip2`. Esto lo puedes ignorar y continuar al paso siguiente.

</details>
<br>

OK. Cuando este comando termine de ejecutarse, le diremos al sistema que use esta versión de Python **por defecto**. Esto se hace con:

```bash
pyenv global 3.8.12
exec zsh
```

Para verificar si esto ha funcionado, ejecuta `python --version`. Si ves `3.8.12`, ¡todo está bien! Si no, pídele ayuda a un TA para resolver el problema por medio `pyenv versions` y `type -a python` (`python` debería estar usando la versión `.pyenv/shims` de primero).


## Entorno Virtual de Python

Antes de instalar paquetes de Python, aislaremos la configuración del Bootcamp en un entorno virtual **dedicado**. Usaremos un plugin `pyenv` llamado [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv).

Primero instala este plugin:

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec zsh
```

Crea el entorno virtual que usaremos durante todo el bootcamp:

```bash
pyenv virtualenv 3.8.12 lewagon
```

Define el entorno virtual con lo siguiente:

```bash
pyenv global lewagon
```

¡Genial! Ahora cada vez que queramos instalar un paquete Python, lo haremos en ese entorno.


## Paquetes de Python

Ahora que tenemos el ambiente virtual de `lewagon` adecuado, es hora de instalarle algunos paquetes.

Primero, actualiza `pip`, la herramienta para instalar Paquetes Python desde [pypi.org](https://pypi.org). Ejecuta lo siguiente en la última terminal donde esté activado el virtualenv de `lewagon`:

```bash
pip install --upgrade pip
```

Ahora instala algunos paquetes para las primeras semanas del programa:

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


## Extensiones de `jupyter` notebook

Mejora tu `jupyter` notebooks con extensiones increíbles:

```bash
# install nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable toc2/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable spellchecker/main
jupyter nbextension enable code_prettify/code_prettify
```

### CSS personalizado

Mejora la visualización del [elemento `details` para revelación de información](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) en tus notebooks.

Abre `custom/custom.css` en el directorio config:
```bash
cd $(jupyter --config-dir)
mkdir -p custom
touch custom/custom.css
code custom/custom.css
```
Edita `custom.css` con la siguiente información:

```css
summary {
    cursor: pointer;
    display:list-item;
}
summary::marker {
    font-size: 1em;
}
```

Puedes cerrar VS Code.

### Chequeo de `jupyter`

Reinicia tu terminal:

```bash
exec zsh
```

Ahora verifica que puedas iniciar un servidor de notebook en tu máquina:

```bash
jupyter notebook
```

Tu navegador web debería abrir en una ventana `jupyter`:

![jupyter.png](images/jupyter.png)

Haz clic en `New`:

![jupyter_new.png](images/jupyter_new.png)

Debería abrirse una pestaña en un nuevo notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

### Chequeo de `nbextensions`

Haz una revisión de las `jupyter notebooks nbextensions`. Haz clic en `Nbextensions`:

![jupyter_nbextensions.png](images/jupyter_nbextensions.png)

Deselecciona _"disable configuration for nbextensions without explicit compatibility"_. Esto significa deshabilitar la configuración de nbextensions sin compatibilidad explícita. Luego verifica que _al menos_ las `nbextensions` marcadas en rojo estén habilitadas:

![nbextensions.png](images/nbextensions.png)

Puedes cerrar tu navegador web y luego cerrar el servidor jupyter con `CTRL` + `C`.


### Chqueo de la configuración de Python

Verifica tu versión de Python con los siguientes comandos:
```bash
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh)" 3.8.12
```

Ejecuta el comando siguiente para verificar que hayas instalado los paquetes requeridos correctamente:
```bash
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh)"
```

Ahora ejecuta el siguiente comando para verificar que puedas cargar estos paquetes:
```bash
python -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py)"
```

Asegúrate de que puedas usar Jupyter:

```bash
jupyter notebook
```

Y abre un notebook `Python 3`.

Asegúrate de que estés usando la versión correcta de python en el notebook. Abre una celda y ejecuta lo siguiente:
``` python
import sys; sys.version
```

¡Listo! Ya tienes un virtual env de python completo con todos los paquetes de terceros que necesitarás en el bootcamp.



## DBeaver

Descarga e instala [DBeaver](https://dbeaver.io/), una herramienta poderosa, gratuita y de código abierto para conectar con cualquier base de datos, explorar su esquema e incluso **hacer consultas SQL**.


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



## CLI de `gcloud`

Antes de configurar nuestra cuenta Google Cloud Platform vamos a configurar el CLI de `gcloud` (una interfaz de línea de comando para Google Cloud Platform). Ejecuta el siguiente código y sigue las indicaciones de la terminal para actualizar tu $PATH y habilitar la finalización del comando del shell para el archivo `.zshrc`:

```bash
brew install --cask google-cloud-sdk
```

Luego podrás ejecutar lo siguiente:

```bash
$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh
```


## Configuración de Google Cloud Platform

[GCP](https://cloud.google.com/) es una solución en la nube que usarás para colocar tus productos basados en Machine Learning en producción.

🚨 Si estás en el grupo de estudiantes del **Bootcamp Part Time**, ¡IGNORA ESTA SECCIÓN POR AHORA! **GCP** ofrece $300 en créditos durante 3 meses, así que no es buena idea activar tu cuenta GCP demasiado pronto 🙅‍♂️

### Preparación del Proyecto

- Ve a [Google Cloud](https://console.cloud.google.com/) y crea una cuenta si aún no tienes una
- En la consola de Cloud, en la lista de proyectos, selecciona o crea un proyecto Cloud

![](images/gcp-create-project.png)

- Asígnale un nombre como `Wagon Bootcamp` por ejemplo
- Verás que se creará un `ID` automáticamente para el proyecto e. g. `wagon-bootcamp-123456`

![](images/gcp_project.png)

### Idioma de la cuenta

Abre las preferencias en tu cuenta GCP para facilitar el seguimiento de las instrucciones durante el bootcamp:

https://myaccount.google.com/language

Si el *idioma de preferencia* no es:
- **English**
- **United States**

Cámbialo a inglés:
- Haz clic en el logo edición (es una lapicera)
- Selecciona **English**
- Selecciona **United States**
- Haz clic en **Select**

### Cuenta de facturación

Ahora conecta tu cuenta con tu tarjeta de crédito. Este paso es obligatorio para poder usar los servicios que suministra GCP. No te preocupes, podrás utilizar la mayoría de los servicios de GCP por medio de créditos gratuitos durante el bootcamp.

![](images/gcp-billing.png)

- Haz clic en **Billing**
- Haz clic en **MANAGE BILLING ACCOUNTS**
- Haz clic en **ADD BILLING ACCOUNT**
- Asígnale un nombre a tu cuenta de facturación, e. g. `My Billing Account`
- Haz clic en "I have read..." y acepta los términos de uso
- Haz clic en **CONTINUE**
- Selecciona tu tipo de cuenta: `Individual`
- Agrega tu nombre y dirección

Verás que tienes créditos gratuitos con un valor de "$300 a utilizar en los próximos 90 días".

- Haz clic en los detalles de la tarjeta
- Agrega la información de tu tarjeta de crédito
- Haz clic en **START MY FREE TRIAL**. Esto significa comenzar mi período de prueba.

Cuando termines, verifica que la cuenta de facturación esté conectada con tu proyecto GCP.

- Selecciona tu proyecto
- Ve a **Billing**
- Selecciona **LINK A BILLING ACCOUNT**
- Selecciona `My Billing Account`
- Haz clic en **SET ACCOUNT**

Ahora deberías ver lo siguiente:

```
Free trial status: $300 credit and 91 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.
```

Esto significa Estado de período de prueba: crédito de $300 y 91 días para usarlo - con la full account, tendrás acceso ilimitado a todo lo que ofrece Google Cloud Platform.

<details>
  <summary>👉 Si no tienes una tarjeta de crédito 👈</summary>


Si no tienes una tarjeta de crédito, puedes abrir una cuenta en **Revolut**.
Revolut es una aplicación que funciona como un banco y que te permitirá crear una tarjeta de crédito virtual conectada a la dirección de facturación de tu smartphone.

Ignora este paso si ya tienes una tarjeta de crédito. Simplemente úsala para hacer la configuración.

Descarga la app Revolut o ve a [revolut](https://www.revolut.com/a-radically-better-account) y sigue los pasos para descargar la app (introduce tu número de teléfono móvil y haz clic en Get Started).

- Abre la app Revolut
- Agrega tu número de teléfono móvil
- Agrega el código de verificación que recibiste por SMS
- La app te preguntará por tu país, dirección, primer y segundo nombre, fecha de nacimiento y el email
- La app también te pedirá tu profesión y una selfie
- La app te pedirá una foto de tu documento nacional de identidad o pasaporte

Cuando termines, selecciona el plan estándar (gratuito). No tienes que agregar la tarjeta a Apple pay, pedir que te envíen una tarjeta a tu domicilio ni tampoco agregar dinero a la cuenta.

Ahora tienes una tarjeta virtual que podrás usar para hacer la configuración de GCP.

En la vista principal de la app Revolut
- Haz clic en Ready to use
- Haz clic en the card
- Haz clic en Show card details
- Toma nota de la información de la tarjeta de crédito virtual y úsala para completar la configuración de GCP

</details>

<details>
  <summary>👉 Si recibes un email de Google diciendo "Urgent: your billing account XXXXXX-XXXXXX-XXXXXX has been suspended" 👈</summary>


Esto puede pasar justo después de haber creado la cuenta en Revolut.

- Haz clic en PROCEED TO VERIFICATION
- Te pedirán que envíes una foto de tu tarjeta de crédito (solo los últimos 4 dígitos, nada más)
- Si ya has usado **Revolut**, puedes enviar una captura de pantalla de tu tarjeta de crédito virtual (no olvides quitar la fecha de vencimiento de la captura)
- Explica que estás haciendo el bootcamp de Le Wagon, que no tienes una tarjeta de crédito y que acabas de crear una cuenta en Revolut para poder configurar GCP para el bootcamp con una tarjeta de crédito virtual

Es posible que te validen la cuenta pero también es posible que te pidan más información en los próximos 30 minutos.

Cuando la cuenta sea validada recibirás un email diciendo lo siguiente: "Your Google Cloud Platform billing account XXXXXX-XXXXXX-XXXXXX has been fully reinstated and is ready to use.". Esto significa que tu cuenta Google Cloud Platform ha sido restablecida

</details>

### Habilitación de servicios de GCP

- Asegúrate de que la facturación está habilitada para tu proyecto Google Cloud

ℹ️ Tienes un **crédito de $300** para usar con recursos de Google Cloud. Esto será más que suficiente para el bootcamp.

- [Habilita las APIs AI Platform Training & Prediction y Compute Engine APIs](https://console.cloud.google.com/flows/enableapi?apiid=ml.googleapis.com,compute_component&_ga=2.269215094.662509797.1580849510-2071889129.1567861089&_gac=1.154971594.1580849512.CjwKCAiAyeTxBRBvEiwAuM8dnbZ6uMwizbZW44J2mBCX6ncEjwjwpgF8S8QsvhYAXLkJ8awDnIRTNRoCJ_0QAvD_BwE) (Esto puede tomar varios minutos)

### Configuración de Cloud sdk

- Autentica el CLI de `gcloud` con la cuenta que usaste para GCP
```bash
gcloud auth login
```
- Inicia sesión en tu cuenta Google en la nueva pestaña que se abrió en tu navegador
- Lista la cuenta que tienes activa y verifica que el email que usaste para GCP está ahí
```bash
gcloud auth list
```
- Define tu proyecto actual (reemplaza `PROJECT_ID` con el `ID` de tu proyecto e.g. `wagon-bootcamp-123456`)
```bash
gcloud config set project PROJECT_ID
```
- Lista la cuenta que tienes activa y tu proyecto actual y verifica que tu proyecto está ahí
```bash
gcloud config list
```

### Crea una llave 🔑 de cuenta de servicio

Como ya creaste una cuenta `GCP account` y un `project` (identificado por su `PROJECT_ID`), vamos a configurar las acciones (llamadas API calls) que quieres que tu código ejecute.

<details>
  <summary>🤔 ¿Por qué necesitamos una clave de cuenta de servicio?</summary>


  Creaste una `cuenta GCP` conectada a una tarjeta de crédito. Te facturarán de acuerdo al uso que les des a los recursos de **Google Cloud Platform**. El cargo se hará si utilizas algo después de que el período de prueba gratuito se haya terminado o si te excedes del límite de consumo que te permite dicho período.

  En tu `cuenta GCP` has creado un solo `proyecto GCP` identificado por su `PROJECT_ID`. Los `proyectos GCP` te permiten organizar y monitorear la manera en que consumes los recursos **GCP** de forma más precisa. En este bootcamp solo crearemos un solo proyecto.

  Ahora necesitamos una manera de saber qué recursos nuestro código podrá consumir dentro de un `GCP project`. Nuestro código consume recursos GCP por medio de llamadas API.

  Ya que las llamadas API no son gratuitas, es importante definir cuidadosamente cómo nuestro código las utilizará. Sin embargo, durante el bootcamp no habrá restricciones. Le permitiremos a nuestro código que utilice todas las API **GCP** sin restricciones.

  Así como pueden haber varios proyectos asociados a una cuenta GCP, un proyecto puede estar compuesto de muchos servicios (cualquier paquete de código, sin importar su formato, que necesite utilizar llamadas a la API de GCP para cumplir con su propósito).

  GCP exige que los servicios de los proyectos que usen llamadas API se registren en la plataforma y que se configuren sus credenciales por medio del acceso concedido a una `service account`.

  Por ahora solo tendremos que usar un solo servicio y crearemos la `service account` correspondiente.
</details>

Ya que la [service account](https://cloud.google.com/iam/docs/service-accounts) es lo que identifica tu aplicación (y por ende tu cuenta de facturación GCP y, en última instancia, tu tarjeta de crédito), lo mejor es ser cuidadoso en los próximos pasos.

⚠️ **No compartas la 🔑 del archivo json de tu cuenta de servicio** ⚠️ No la guardes en tu escritorio ni en tu código base de git (incluso si tu repositorio git es privado). Que no se te olvide en un lugar como la máquina de café y, por supuesto, no la envíes en un tweet.

- Ve a la [página de las cuentas de servicio](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
- Selecciona tu proyecto en la lista de proyectos recientes si te piden que
- Crees una cuenta de servicio:
  - Haz clic en **CREATE SERVICE ACCOUNT** que significa crear une cuenta de servicio:
  - Define un `Service account name` para esa cuenta. Esto significa Nombre de cuenta de servicio
  - Haz clic en **CREATE AND CONTINUE** que significa crear y continuar
  - Haz clic en **Select a role** que significa selecciona un rol. Escoge `Quick access/Basic` luego **Owner**. Esto  otorga acceso total a todos los recursos
  - Haz clic en **CONTINUE**
  - Haz clic en **DONE**
- Descarga la 🔑 del archivo json de la cuenta de servicio:
  - Haz clic en la cuenta de servicio recién creada
  - Haz clic en **KEYS**
  - Haz clic en **ADD KEY** y luego en **Create new key**
  - Selecciona **JSON** y haz clic en **CREATE**

![](images/gcp_create_key.png)

El navegador acaba de guardar la 🔑 del archivo json de la cuenta de servicio en tu carpeta de descargas (el nombre se le asigna según el nombre de la cuenta de servicio. Es algo como `le-wagon-data-123456789abc.json`)


- Guarda el archivo json de la cuenta de servicio en un lugar que recuerdes. Por ejemplo:

``` bash
/Users/MACOS_USERNAME/code/GITHUB_NICKNAME/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json
```

- Guarda la **ruta absoluta** al archivo `JSON` como una variable de entorno:

``` bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/path/to/the/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.aliases
```



<details>
  <summary>ℹ️ ¿Cómo encontrar la ruta absoluta de un archivo?</summary>
  Puedes arrastrar el archivo a tu terminal.
</details>

**Reinicia** tu terminal y ejecuta lo siguiente:

``` bash
echo $GOOGLE_APPLICATION_CREDENTIALS
```

Deberías obtener la siguiente información:

```bash
/some/absolute/path/to/your/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json
```

Ahora verifica si la ruta al archivo json de tu cuenta de servicio es el correcto:

``` bash
cat $(echo $GOOGLE_APPLICATION_CREDENTIALS)
```

👉 Este comando debería mostrar el contenido del archivo json de tu cuenta de servicio. Si no es el caso, pídele ayuda a un TA 🙏

Tu código y utilidades ahora pueden acceder a los recursos de tu cuenta GCP.

Continuemos con los últimos pasos de la configuración...

- Lista las cuentas de servicio asociadas a tu cuenta activa y a tu proyecto actual
```bash
gcloud iam service-accounts list
```
- Recupera el email de la cuenta de servicio e. g. `SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com`
- Lista los roles de la cuenta de servicio desde la cli (reemplaza el PROJECT_ID y el SERVICE_ACCOUNT_EMAIL)
```bash
gcloud projects get-iam-policy PROJECT_ID \
--flatten="bindings[].members" \
--format='table(bindings.role)' \
--filter="bindings.members:SERVICE_ACCOUNT_EMAIL"
```
- Ahora deberías ver que tu cuenta de servicio tiene el rol de `roles/owner`

<details>
  <summary>Resolución de problemas</summary>

- `AccessDeniedException: 403 The project to be billed is associated with an absent billing account.`. Esto significa que el proyecto a facturar está asociado a una cuenta de facturación que no está habilitada
  - Asegúrate de habilitar la facturación para tu proyecto https://cloud.google.com/billing/docs/how-to/modify-project
</details>

🏁 Listo. ¡Has terminado la configuración de GCP!


## Kitt

:warning: Si recibiste una invitación por email de Le Wagon para crear una cuenta en Kitt (nuestra plataforma de aprendizaje), ignora este paso y sigue las instrucciones en el email si es que todavía no lo has hecho.

Si no sabes que hacer, haz clic en [este enlace](https://kitt.lewagon.com/). Si ya iniciaste sesión, puedes omitir esta sección. Si no, haz clic en `Enter Kitt as a Student`. Esto significa iniciar sesión como estudiante. Si no tienes problemas para iniciar sesión, puedes omitir este paso. De lo contrario pídele a un profesor que te confirme si debiste haber recibido o si debes seguir las instrucciones de aquí abajo.

Registrate como alumni de Le Wagon yendo a [kitt.lewagon.com/onboarding](http://kitt.lewagon.com/onboarding). Selecciona tu batch, inicia sesión con GitHub y completa toda la información que te piden.

Ahora tu profesor podrá validar que realmente eres parte del batch. Pídele que lo haga justo después de que hayas completado el formulario de registro.

Cuando el profesor haya aprobado tu perfil, ve a la bandeja de entrada de tu email. Deberías tener 2 nuevos emails:

- Uno de Slack, invitándote a la comunidad de los alumni de Le Wagon en slack (donde podrás chatear con tus compañeros y todos los demás alumni). Haz clic en **Join** y completa la información que te piden.
- Otro de GitHub, invitándote a `lewagon` team. **Acéptala**, de lo contrario no podrás acceder a las diapositivas de las clases.


## Slack

[Slack](https://slack.com/) es una plataforma de comunicación popular en la industria tech.

### Instalación

[Descarga la aplicación Slack](https://itunes.apple.com/fr/app/slack/id803453959?mt=12) e instálala.

:warning: Si ya estás usando Slack en tu navegador, por favor descarga e instala  **la aplicación de escritorio** la cual tiene todas las funciones.


### Parámetros

Abre la aplicación e inicia sesión en `lewagon-alumni`.

Asegúrate de **subir una foto para tu perfil** :point_down:

![Cómo subir una foto de perfil en Slack](https://github.com/lewagon/setup/blob/master/images/slack_profile_picture.gif)

La idea es tener Slack abierto todo el día para compartir enlaces útiles / pedir ayuda / decidir dónde almorzar / etc.

Para asegurarte de que todo lo relacionado a videollamadas funcione bien, prueba tu cámara y tu micrófono:
- Abre la aplicación Slack
- Escribe `/call --test` en la barra de mensaje de cualquier canal y presiona `ENTER`
- Haz clic en el botón verde "Start test"

![Chequea el micrófono y la cámara con Slack](https://github.com/lewagon/setup/blob/master/images/slack_call_test.png)

:heavy_check_mark: Cuando termine el test deberías ver mensajes de "Succeed" en verde por lo menos para tu micrófono y tu cámara. :+1:

:x: Si no es el caso, **contacta a un profesor**.

¡También puedes instalar la aplicación Slack en tu smartphone e iniciar sesión en `lewagon-alumni`!


## Kata (Extra)

Si has terminado la configuración, te pedimos que preguntes si alguien necesita ayuda con la suya (macOS, Linux o Windows). Las primeras clases son a las 2pm. Hablaremos de la configuración que acabas de hacer y de Kitt.

Si no tienes mucha experiencia con `git` y GitHub, por favor [ve nuevamente el video de este workshop](https://www.youtube.com/watch?v=Z9fIBT2NBGY) (puedes verlo a `1.25` de velocidad).

Si aún te queda tiempo, puedes esperar trabajar en este [Kata de Tic-Tac-Toe](https://www.codewars.com/kata/5b817c2a0ce070ace8002be0/train/python) mientras esperas la primera clase.


