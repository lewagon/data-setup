## `jupyter` notebook extensions

Pimp your `jupyter` notebooks with awesome extensions:

```bash
# install nbextensions
pip install jupyter_contrib_nbextensions
pip install jupyter_nbextensions_configurator
jupyter contrib nbextension install --user
jupyter nbextension enable toc2/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable spellchecker/main
jupyter nbextension enable code_prettify/code_prettify
```

### Sublime Text shortcuts

[Add sublime text shortcuts to jupyter notebook](http://blog.rtwilson.com/how-to-get-sublime-text-style-editing-in-the-ipythonjupyter-notebook/)

Find the `jupyter` config directory:
``` bash
JUPYTER_CONFIG_DIR=$(jupyter --config-dir)
```

Open `custom/custom.js` in the config directory:
```bash
cd $JUPYTER_CONFIG_DIR
<CODE_EDITOR_CMD> custom/custom.js
```
Edit `custom.js` with:
``` js
require(["codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
    function(sublime_keymap, cell, IPython) {
        // setTimeout(function(){ // uncomment line to fake race-condition
        cell.Cell.options_default.cm_config.keyMap = 'sublime';
        var cells = IPython.notebook.get_cells();
        for(var cl=0; cl< cells.length ; cl++){
            cells[cl].code_mirror.setOption('keyMap', 'sublime');
        }
        // }, 1000)// uncomment  line to fake race condition
    }
);
```

You can close <CODE_EDITOR>.

### `jupyter` check up

Check you can launch a notebook server on your machine:
```bash
jupyter notebook
```
Your web browser should open on a `jupyter` window:

![jupyter.png](images/jupyter.png)

Click on `New`:

![jupyter_new.png](images/jupyter_new.png)

A tab should open on a new notebook:

![jupyter_notebook.png](images/jupyter_notebook.png)

### `nbextensions` check up

Perform a sanity check for `jupyter notebooks nbextensions`. Click on `Nbextensions`:

![jupyter_nbextensions.png](images/jupyter_nbextensions.png)

Check that the `nbextensions` are enabled:

![nbextensions.png](images/nbextensions.png)

You can close your web browser then terminate the jupyter server with `CTRL` + `C`.
