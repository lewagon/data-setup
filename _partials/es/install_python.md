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

{% if os == "macos" %}
``` bash
/Users/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% elsif os == "windows" %}
``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% elsif os == "linux" %}
``` bash
/home/your-username/.lewagon/venvs/lewagon/bin/python3
```
{% endif %}

Si no lo hace, ¡consulta con un TA! No continúes con el siguiente paso hasta que hayas resuelto esto.


### Instalar dependencias

Python es genial para datos, porque la comunidad ha desarrollado una enorme cantidad de paquetes que podemos reutilizar.

Instalemos los más comunes:

{% if os == "macos" %}
``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/apple_silicon.txt
```
{% elsif os == "windows" %}
``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
{% elsif os == "linux" %}
``` bash
uv pip install -r https://raw.githubusercontent.com/lewagon/data-setup/master/specs/releases/linux.txt
```
{% endif %}
