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
