## Linking your default browser to Ubuntu

To be sure that you can interact with your browser installed on Windows from your Ubuntu terminal, we need to set it as your default browser there.

Run the following command and follow the instructions. The tool will prompt you to choose one of the browsers that are available on your system. You just need to type in the **number** that is shown in front of the browser.

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/julesvanrie/wslsetbrowser/refs/heads/main/wslsetbrowser.sh)"
```

Reset your terminal:

```bash
exec zsh
```

Then please make sure that the following command returns "Browser defined 👌":

```bash
[ -z "$BROWSER" ] && echo "ERROR: please define a BROWSER environment variable ⚠️" || echo "Browser defined 👌"
```

If it does not, you can follow [these instructions](https://github.com/lewagon/setup/blob/master/_partials/windows_browser.md) to set your default browser manually.

Do not hesitate to **contact a teacher**.
