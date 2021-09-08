## Python packages

Now that we have a pristine `lewagon` virtual environment, it's time to install some packages in it.

First, let's upgrade `pip`, the tool to install Python Packages from [pypi.org](https://pypi.org). In the latest terminal where the virtualenv `lewagon` is activated, run:

```bash
pip install --upgrade pip
```

Then let's install some packages for the first weeks of the program:

```bash
pip install -Ur <REQUIREMENTS_URL>
```

Finally, more Data Science packages:

```bash
pip install -U <BOOTCAMP_COMPLETE_REQUIREMENTS>
```

### TensorFlow

Install [TensorFlow](https://www.tensorflow.org/):
$MAC_START

<details>
    <summary>Setup for Intel chips (default)</summary>
$MAC_END

```bash
pip install -U '<TENSORFLOW_TOP_VERSION>'
```
$MAC_START

</details>

<details>
    <summary>Setup for Apple Silicon chips</summary>

```bash
pip install -U <APPLE_SILICON_TENSORFLOW_PACKAGES>
```

</details>
$MAC_END
