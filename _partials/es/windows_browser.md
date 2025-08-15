## Linking your default browser to Ubuntu

Para asegurarnos de que puedas interactuar desde la terminal de Ubuntu con el navegador que tienes instalado en Windows, debemos definirlo como tu navegador predeterminado aquí.

Ejecuta el siguiente comando y sigue las instrucciones. La herramienta te pedirá que elijas uno de los navegadores disponibles en tu sistema. Solo necesitas escribir el **número** que aparece delante del navegador.

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/julesvanrie/wslsetbrowser/refs/heads/main/wslsetbrowser.sh)"
```

Reinicia tu terminal:

```bash
exec zsh
```

Luego asegúrate de que el siguiente comando devuelva "Browser defined 👌":

```bash
[ -z "$BROWSER" ] && echo "ERROR: please define a BROWSER environment variable ⚠️" || echo "Browser defined 👌"
```

Si no es así, puedes seguir [estas instrucciones](https://github.com/lewagon/setup/blob/master/_partials/es/windows_browser.md) para configurar tu navegador predeterminado manualmente.

No dudes en **pedirle ayuda a tu profesor**.
