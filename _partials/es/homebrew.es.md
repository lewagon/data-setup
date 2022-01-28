## Homebrew
### 1. Instálalo:
Si usas Mac tienes que instalar [Homebrew](http://brew.sh/) el cual es un sistema de gestión de paquetes.
Será necesario cuando tengamos que instalar algún programa.
Para instalarlo, abre tu Terminal y ejecuta lo siguiente:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Te pedirá tu confirmación (presiona `Enter`) y tu **contraseña de usuario macOS** (la que usas para [iniciar sesión](https://support.apple.com/en-gb/HT202860) cuando reinicias tu Macbook).
:warning: Cuando escribas tu contraseña en la Terminal, **no** la verás (tampoco verás algo como `*****`). ¡Esto es **normal**! Simplemente escribe tu contraseña y confirma presionando `Enter`.

<details>
  <summary>🛠 Si aparece un <code>Error: Not a valid ref: refs/remotes/origin/master</code> </summary>


El error completo es el siguiente:

``` bash
Error: Not a valid ref: refs/remotes/origin/master :
fatal: ambiguous argument 'refs/remotes/origin/master': unknown revision or path not in the working tree.
```

Ejecuta los siguientes comandos para resolverlo:

``` bash
rm -fr $(brew --repo homebrew/core)  # because you can't `brew untap homebrew/core`
brew tap homebrew/core
```

</details>

Si ya tienes Homebrew, el sistema te lo dirá. No hay problema, así que puedes continuar.

### 2. Asegúrate de tener la versión más reciente:

```bash
brew update
```

<details>
  <summary>🛠 Si aparece un error <code>/usr/local must be writable</code> </summary>

Simplemente ejecuta lo siguiente:

``` bash
sudo chown -R $USER:admin /usr/local
brew update
```

</details>

### 3. Luego instala algunos programas útiles:

Ejecuta lo siguiente en la terminal (puedes copiar / pegar todas las líneas juntas una sola vez).

```bash
brew upgrade git         || brew install git
brew upgrade gh          || brew install gh
brew upgrade wget        || brew install wget
brew upgrade imagemagick || brew install imagemagick
brew upgrade jq          || brew install jq
brew upgrade openssl     || brew install openssl
brew upgrade tree        || brew install tree
brew upgrade ncdu        || brew install ncdu
brew upgrade xz          || brew install xz
brew upgrade readline    || brew install readline
```
