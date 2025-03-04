## Paquetes de Python

Ahora que tenemos el ambiente virtual de `lewagon` adecuado, es hora de instalarle algunos paquetes.

Primero, actualiza `pip`, la herramienta para instalar Paquetes Python desde [pypi.org](https://pypi.org). Ejecuta lo siguiente en la última terminal donde esté activado el virtualenv de `lewagon`:

```bash
pip install --upgrade pip
```

Ahora instala algunos paquetes para las primeras semanas del programa:

$MAC_START
Si tu computadora usa **Apple Silicon**, expande el párrafo de abajo y léelo. Si no es el caso, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Configuración para Apple Silicon 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/no-update/specs/releases/apple_silicon.txt
```
</details>

Si tu computadora usa **Apple Intel**, expande el párrafo de abajo y léelo. Si no es el caso, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Configuración para Apple Intel 👈</summary>

``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/no-update/specs/releases/apple_intel.txt
```
</details>
$MAC_END
$WINDOWS_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/no-update/specs/releases/linux.txt
```
$WINDOWS_END
$LINUX_START
``` bash
pip install -r https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/no-update/specs/releases/linux.txt
```
$LINUX_END
