## Jupyter Notebook tweaking

Depending on your system, we need to make some small changes to your Jupyter configuration.

Run this:

```bash
bash -c "$(curl -s https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/checks/setup_jupyter.sh)"
```

<details>
<summary>If you are curious about what happens here, click here.</summary>

This script adds a configuration to improve the display of the [`details` disclosure elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) in your notebooks.

If you're using Windows WSL, it also fixes some other problems.
{% if os == "windows" %}
- It makes sure you're browser is configured correctly. It was configured before, but was overwritten by the dotfiles setup.
- It fixes a known bug with Jupyter Notebook always opening the directory tree, even if you specify a specific file path.
{% endif %}

</details>
