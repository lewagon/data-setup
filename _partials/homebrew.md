## Homebrew

On Mac, you need to install [Homebrew](http://brew.sh/) which is a Package Manager.
It will be used as soon as we need to install some software.

### Do you already have Homebrew?

Maybe you already have it installed from the Web Development bootcamp or from other tutorials. The easy way to check is to run the following in the terminal:

```bash
brew --config
```

If you see something along those lines:

```bash
HOMEBREW_VERSION: 2.2.2
ORIGIN: git@github.com:Homebrew/brew.git
HEAD: 13f508d0dc8ada1726ee09a750285d7447ac3df4
Last commit: 3 weeks ago
Core tap ORIGIN: https://github.com/Homebrew/homebrew-core
Core tap HEAD: 3dfe6ba274492a06a2116effef37353a800e5052
Core tap last commit: 4 hours ago
HOMEBREW_PREFIX: /usr/local
HOMEBREW_NO_ANALYTICS: 1
CPU: quad-core 64-bit broadwell
Homebrew Ruby: 2.6.3 => /usr/local/Homebrew/Library/Homebrew/vendor/portable-ruby/2.6.3/bin/ruby
Clang: 10.0 build 1001
Git: 2.24.1 => /usr/local/bin/git
Curl: 7.54.0 => /usr/bin/curl
Java: 1.8.0_74
macOS: 10.14.6-x86_64
CLT: 10.3.0.0.1.1562985497
```

Then you **do** have Homebrew installed. In that case you just need to update it with:

```bash
brew update
```

If you **don't** have it installed, just run:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

This will ask for your confirmation (hit `Enter`) and your laptop session password.

:warning: **ONLY IF** you get a `/usr/local must be writable` error, just run this:

```bash
sudo chown -R $USER:admin /usr/local
brew update
```

### Installing git

```bash
brew install git || brew upgrade git
```

To check which version of `git` you got, you can type:

```bash
git --version
```

If you have something _above_ `2.24` you are good to go!

### Installing useful terminal tools

`tree` is a nice tool to visualize a directory tree from the terminal.

`ncdu` is a text-based interface disk utility.

`htop` is an interactive process viewer.

`tig` is a text-mode interface for `git`.

`hub` is a command line tool that wraps `git` in order to extend it with extra features and commands that make working with GitHub easier.


```bash
brew install tree ncdu htop tig hub
```

We are going to install more software thanks to `brew`, if you want to know what you _already_ have installed you can run:

```bash
brew leaves
```

Coming from the Web Development bootcamp you should already have tools like
[`curl`](https://curl.haxx.se/),
[`hub`](https://hub.github.com/),
[`postgresql`](https://www.postgresql.org/),
[`rbenv`](https://github.com/rbenv/rbenv#readme),
[`redis`](https://redis.io/),
[`yarn`](https://yarnpkg.com/)
and more.

At any moment you can use `brew info <formula>` like so:

```bash
brew info redis
```
