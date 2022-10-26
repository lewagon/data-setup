## Instalación de Python (con [`pyenv`](https://github.com/pyenv/pyenv))

Ubuntu viene con una versión vieja de Python que no queremos usar. Tal vez ya hayas instalado Anaconda u otro programa para utilizar Python y paquetes de Ciencia de Datos. Si es así, no pasa nada ya que haremos una configuración profesional de Python que te permitirá cambiar de versión cuando quieras al escribir `python` en la terminal.

Primero instala `pyenv` con el siguiente comando en la Terminal:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
exec zsh
```

Instala algunas [dependencias](https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites) necesarias para crear Python desde `pyenv`:

```bash
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
python3-dev
```

Instala la [última versión estable de Python](https://www.python.org/doc/versions/) que sea aceptada en el currículum de Le Wagon:

```bash
pyenv install <PYTHON_VERSION>
```

Este comando puede tomar un tiempo en ejecutarse. Esto es completamente normal. ¡No dudes en ayudar a los estudiantes que estén sentados cerca de ti!

OK. Cuando este comando termine de ejecutarse, le diremos al sistema que use esta versión de Python **por defecto**. Esto se hace con:

```bash
pyenv global <PYTHON_VERSION>
exec zsh
```

Para verificar que esto haya funcionado, ejecuta `python --version`. Si ves `<PYTHON_VERSION>`, ¡todo está bien! Si no, pídele ayuda a un TA para resolver el problema por medio de `versiones de pyenv` y `type -a python` (`python` debería estar usando la versión `.pyenv/shims` de primero).
