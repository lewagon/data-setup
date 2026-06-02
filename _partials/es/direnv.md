## direnv

[direnv](https://direnv.net/) es una extensión del shell. Facilita trabajar con variables de entorno por proyecto, lo cual será útil para customizar el comportamiento de tu código.

{% if os == "macos" %}
``` bash
brew install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
{% elsif os == "windows" %}
``` bash
sudo apt-get update; sudo apt-get install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
{% elsif os == "linux" %}
``` bash
sudo apt-get update; sudo apt-get install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
{% endif %}
