
# NOTE(ssaunier): This script needs https://github.com/lewagon/setup to be cloned as well

## Build guides

`bundle exec ruby build.rb` generates the setup guide markdown files at the repo root (e.g. `macOS.md`, `macOS.es.md`).

Each file in `builds/` defines one guide:

```yaml
os: macos
locales: [en, es]
partials:
  - intro              # local: _partials/intro.md / _partials/es/intro.md
  - setup/github       # remote: lewagon/setup _partials/github.md
  - de_setup/direnv    # remote alias: lewagon/data-engineering-setup _partials/direnv.md
```

Partials without a `/` are loaded from `_partials/` (English) or `_partials/{locale}/` (other locales).
Partials with a `/` are fetched from GitHub: `{repo}/_partials/{locale}/{name}.md`. Remote repo branches and aliases are configured in `constants/repos.yml`.

Template variables available in all partials are defined in `constants/constants.yml`.

CI runs the build on every push and commits the generated files if they changed.

## Guide descriptions

`VM`: student installs VS Code, creates a GCP VM, runs setup on the VM

`REMOTE_SETUP`: student installs VS Code, redeems a Le Wagon-provided VM, runs setup on the VM
