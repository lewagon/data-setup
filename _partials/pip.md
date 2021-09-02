## Python packages

Now that we have a pristine `lewagon` virtual environment, it's time to install some packages in it.

First, let's upgrade `pip`, the tool to install Python Packages from [pypi.org](https://pypi.org). In the latest Ubuntu terminal where the virtualenv `lewagon` is activated, run:

```bash
pip install --upgrade pip
```

Then let's install some packages for the first weeks of the program:

```bash
pip install -Ur <REQUIREMENTS_URL>
```

Finally, more Data Science packages:

```bash
pip install -U yapf jupyterlab seaborn plotly nbconvert xgboost statsmodels pandas-profiling dtale jupyter-resource-usage
```

### TensorFlow

Install [TensorFlow](https://www.tensorflow.org/):
$MAC_START

<details>
    <summary>Setup for Intel chips (default)</summary>
$MAC_END

```bash
pip install -U 'tensorflow<2.6'
```
$MAC_START

</details>

<details>
    <summary>Setup for Apple Silicon chips</summary>

```bash
pip install -U tensorflow-macos tensorflow-metal
```

</details>
$MAC_END

### Python setup check up

Check your Python version with the following commands:
```bash
curl <PYTHON_VERSION_URL> > python_version.txt
curl <PYTHON_CHECKER_URL> > python_checker.sh && zsh python_checker.sh && rm python_checker.sh && rm python_version.txt
```

Run the following command to check if you successfully installed the required packages:
```bash
curl <PIP_CHECKER_URL> > pip_check.sh && zsh pip_check.sh && rm pip_check.sh
```

Now run the following command to check if you can load these packages:
```bash
curl <PIP_LOADER_URL> > pip_check.py && python pip_check.py && rm pip_check.py
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.
