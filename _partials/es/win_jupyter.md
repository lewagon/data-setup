### Configuración de Jupyter Notebook para abrirlo en tu navegador

Genera el archivo de configuración para **Jupyter Notebook**...

``` bash
jupyter notebook --generate-config
```

⚠️ Por favor copia la ruta que arrojó el comando anterior.

Ahora edita el archivo de configuración de Jupyter generado:

``` bash
sed -i.backup 's/# c.ServerApp.use_redirect_file = True/c.ServerApp.use_redirect_file = False/' ~/.jupyter/jupyter_notebook_config.py
```

Intenta usar Jupyter:

``` bash
jupyter notebook
```

Este comando debió haber abierto una página Jupyter en tu navegador:

![](images/wsl_jupyter_notebook.png)

Si no es el caso, por favor llama a un TA.

Para cerrar el servidor jupyter en la terminal, presiona `CTRL` + `C`, enter y. Luego presiona Enter.
