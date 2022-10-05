## direnv

[direnv](https://direnv.net/) is a shell extension. It makes it easy to deal with per project environment variables. This will be useful in order to customize the behavior of your code.

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
