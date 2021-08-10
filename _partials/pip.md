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
pip install -U yapf jupyterlab seaborn plotly tensorflow nbconvert xgboost statsmodels pandas-profiling dtale jupyter-resource-usage
```

### Packages check up

Run the following command to check if you successfully installed the required packages:
```bash
curl https://gist.githubusercontent.com/krokrob/2e5a61b20582b55bbb034c4ea1e9f633/raw/6b49cb880b8498ed4eaaff23048d2c694bb13b7e/pip_check.sh > pip_check.sh && zsh pip_check.sh && rm pip_check.sh
```

Now run the following command to check if you can load these packages:
```bash
curl <PIP_CHECKER_URL> > pip_check.py && python pip_check.py && rm pip_check.py
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.
