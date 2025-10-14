
## `gcloud` CLI

Before Setting up our Google Cloud Platform account let's configure the `gcloud` CLI (A command line interface for Google Cloud Platform). Run the below and follow the terminal prompts to update your $PATH and enable shell command completion for the `.zshrc` file:

```bash
brew install --cask google-cloud-sdk
```

Then you can:

```bash
$(brew --prefix)/share/google-cloud-sdk/install.sh
```

<details>
  <summary>Getting a <code>no such file or directory</code> error?
  </summary>

  Try this:

```bash
$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh
```

If that doesn't work, contact a TA.

</details>
