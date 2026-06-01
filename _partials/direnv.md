## direnv

[direnv](https://direnv.net/) is a shell extension. It makes it easy to deal with per project environment variables. This will be useful in order to customize the behavior of your code.

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
