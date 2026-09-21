## Configuración de Jupyter Notebook

Dependiendo de tu sistema, necesitamos hacer algunos cambios pequeños en tu configuración de Jupyter.

Ejecuta esto:

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/checks/setup_jupyter.sh)"
```

<details>
<summary>Si tienes curiosidad sobre lo que sucede aquí, haz clic aquí.</summary>

Este script añade una configuración para mejorar la visualización de los [elementos `details`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) en tus notebooks.

Si estás usando Windows WSL, también soluciona otros problemas.
{% if os == "windows" %}
- Se asegura de que tu navegador esté configurado correctamente. Ya estaba configurado, pero la configuración de dotfiles lo sobrescribió.
- Soluciona un error conocido en Jupyter Notebook que siempre abre el árbol de directorios, incluso si especificas una ruta de archivo específica.
{% endif %}

</details>
