Abre tu terminal y ve a tu proyecto `dotfiles`:

```bash
cd ~/code/$GITHUB_USERNAME$/dotfiles
```

Es hora de fusionar los cambios de lewagon/dotfiles en los tuyos:

1. Commit la versión actual de tus dotfiles:
   ```bash
   git add .
   git status # Check what will be committed
   git commit -m "Version prior to new setup"
   ```

1. Trae los cambios del repositorio upstream: `git merge upstream/master`

1. Verifica que no estés en estado MERGING. Si lo estás, resuelve los conflictos.

1. Haz un `git diff HEAD~1 HEAD` para revisar qué cambió.

1. Si todo parece estar en orden, continúa.

<details>
  <summary>¿Demasiados conflictos?
  </summary>

  Vamos a tomar la versión actual de `lewagon/dotfiles`.

  Primero aborta la merge: `git merge --abort`.

  Ejecuta `<CODE_EDITOR_CMD> .`

  En <CODE_EDITOR>, abre el archivo zshrc. Reemplaza su contenido con la [versión más reciente](https://raw.githubusercontent.com/lewagon/dotfiles/master/zshrc). Luego guárdalo en el disco.

  Aún en <CODE_EDITOR>, abre el archivo `zprofile`. Reemplaza su contenido con la [versión más reciente](https://raw.githubusercontent.com/lewagon/dotfiles/master/zprofile). Luego guárdalo en el disco.

  Regresa a la terminal y ejecuta un `git diff` y verifica que esto no haya eliminado ninguna configuración personal que quisieras conservar.

</details>

Es hora de guardar tus cambios y subirlos.

```bash
git add .
git commit -m "Update for Data Science bootcamp"
git push origin master
```

</details>
