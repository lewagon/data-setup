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
    - Elimina el repositorio local: `rm -rf ~/code/<your_github_username>/dotfiles`.
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
