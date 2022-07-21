- Guarda el archivo json de la cuenta de servicio en un lugar que recuerdes. Por ejemplo:

``` bash
/Users/MACOS_USERNAME/code/GITHUB_NICKNAME/gcp/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json
```

- Guarda la **ruta absoluta** al archivo `JSON` como una variable de entorno:

``` bash
echo 'export GOOGLE_APPLICATION_CREDENTIALS=/path/to/the/SERVICE_ACCOUNT_JSON_FILE_CONTAINING_YOUR_SECRET_KEY.json' >> ~/.zshrc
```
**Nota:** cada vez que ejecutes este comando, agregará esta línea a tu archivo zshrc sin importar si la línea ya existe en el archivo. Si cometiste un error y necesitas arreglarlo, es preferible que abras el archivo y edites la línea!

Puedes hacerlo ejecutando

```bash
code ~/.zshrc
```

en la Terminal! 😄
