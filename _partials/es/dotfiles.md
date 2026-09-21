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
