# Mantén tu configuración actualizada

Esta sección contiene los pasos que debes seguir para asegurarte de que tu configuración esté actualizada.

Ante todo, para poder trabajar en buenas condiciones, asegúrate de que:
- tienes una conexión a internet de alta velocidad;
- tu ordenador tiene suficiente memoria (8 GB) para ejecutar tu código de manera eficiente;
- tu ordenador tiene suficiente espacio en disco (30 GB) para trabajar con conjuntos de datos grandes.

En esta guía nos centramos en lo esencial:

- Git y GitHub.
- Los `dotfiles`, los archivos de configuración de tu shell. Son importantes para que Python funcione.
- Instalar Python y sus dependencias con `uv`.
- Autenticarte con Google Cloud.

Según tu caso de uso, es posible que también quieras actualizar otras partes. Si es así, consulta las instrucciones completas de configuración.

{% if os == "macos" %}
:warning: Ten en cuenta que la configuración actual ya no es compatible con ordenadores Apple equipados con procesadores Intel.

Consulta las instrucciones completas de configuración si no estás seguro de qué procesador tienes.
{% endif %}


## git

Verifica que git funciona:

``` bash
git --version
```

👉 Deberías obtener un resultado similar a este, que muestra la versión de git:

``` bash
git version 2.33.0
```

Si esto no funciona, te recomendamos seguir las instrucciones completas de configuración.

## GitHub

Comprueba que la CLI de `gh` está autenticada:

✔️ Si obtienes este resultado, todo está correcto 👍

```bash
✔️ Logged in to github.com as <YOUR GITHUB USERNAME>
- Active account: true
- Git operation protocol: ssh
...
```

Presta atención a `ssh` en la tercera línea. Si aparece otra cosa, tu configuración ya no está actualizada.

❌ Si no es así, te recomendamos seguir las instrucciones completas de configuración.


## Actualizar tus dotfiles

Los dotfiles experimentaron un cambio importante en septiembre de 2026. Si los instalaste antes, debes actualizarlos.

Sigue las instrucciones que aparecen a continuación si eres un estudiante que regresa.
