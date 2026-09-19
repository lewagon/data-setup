## Chequeo de la configuración de Python

### Chequeo de Python y packages

Reinicia tu terminal:

```bash
cd ~/code && exec zsh
```

Verifica tu versión de Python con los siguientes comandos:
```bash
zsh -c "$(curl -fsSL {{ PYTHON_CHECKER_URL }})" {{ PYTHON_VERSION }}
```

Ahora verifica que puedas iniciar un servidor de notebook en tu máquina:

```bash
jupyter notebook
```

Tu navegador web debería abrir en una ventana `jupyter`:

![jupyter.png](images/jupyter.png)

Haz clic en `New` y, en el menú desplegable, selecciona Python 3 (ipykernel):

![jupyter_new.png](images/jupyter_new.png)

Debería abrirse una pestaña en un nuevo notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

Asegúrate de que estés usando la versión correcta de python en el notebook. Abre una celda y ejecuta lo siguiente:
``` python
import sys; sys.version
```

Debería mostrar `{{ PYTHON_VERSION }}` seguido de algunos detalles adicionales. Si no es así, consulta con un TA.

En otra celda, ejecuta:

```python
import pandas as pd
pd.__version___
```

Esto podría tomar algunos minutos en ejecutarse. Debería mostrar un número de versión, `2.2.3`. Si no es así, consulta con un TA.

Puedes cerrar tu navegador web y luego cerrar el servidor jupyter con `CTRL` + `C`.

¡Listo! Ya tienes un virtual env de python completo con todos los paquetes tercerizados que necesitarás en el bootcamp.
