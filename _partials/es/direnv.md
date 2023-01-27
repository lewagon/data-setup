## direnv

[direnv](https://direnv.net/) es una extensión del shell. Facilita trabajar con variables de entorno por proyecto, lo cual será útil para customizar el comportamiento de tu código.

$MAC_START
``` bash
brew install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
$MAC_END
$WINDOWS_START
``` bash
sudo apt-get update; sudo apt-get install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
$WINDOWS_END
$LINUX_START
``` bash
sudo apt-get update; sudo apt-get install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```
$LINUX_END
