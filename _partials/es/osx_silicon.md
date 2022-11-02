## Chips Apple Silicon

Si compraste tu computadora después de finales del 2020, es probable que tenga un nuevo chip Apple Silicon en lugar de un procesador Intel: descubrámoslo.

Abre una nueva ventana de la tarminal desde Aplicaciones > Utilidades o búscala con [Spotlight](https://support.apple.com/es-es/HT204014):

![Abrir Terminal en macOS](images/macos_open_terminal.png)

Copia y pega el siguiente comando en la terminal y presiona `Enter` para ejecutarlo.

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/setup/master/utils/macos_list_processor_type.sh)"
```

☝️ El resultado del comando debería indicar si tu computadora usa un chip Apple Silicon.

Si tu computadora usa **Apple Silicon**, expande el siguiente párrafo y ejecútalo. En caso contrario, ignóralo.

<details>
  <summary>👉&nbsp;&nbsp;Setup para Apple Silicon 👈</summary>

Quieres asegurarte que no estás usando Rosetta, que es una forma de usar tu Terminal como si tuvieras una computadora con Intel.

Abre la app Finder (o búscala con [Spotlight](https://support.apple.com/es-es/HT204014)).

Ve a Aplicaciones > Utilidades.

Ubica la app Terminal (selecciónala).

Presiona `Cmd` + `I` en la app Terminal, luego verifica que la caja "Abrir usando Rosetta" esté **desmarcada**.
</details>

🚨 Ten esto en mente. Deberás recordarlo más adelante en este setup si tu computadora usa un chip Apple Silicon o Intel.
