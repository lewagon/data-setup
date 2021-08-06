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

Install [TensorFlow](https://www.tensorflow.org/) with Conda:

```bash
conda install tensorflow
```

Quit **all your opened terminal windows** (`Cmd` + `Q`) and restart one.

### Packages check up

Run the following command to check if you successfully installed the required packages:
```bash
curl https://gist.githubusercontent.com/krokrob/f833e9fd734bc9a4cdd0c6a9cd0b545b/raw/322006a69f4745d658bfc1f3698d49a7624961c9/conda_check.sh && zsh conda_check.sh && rm conda_check.sh
```

Now run the following command to check if you can load these packages:
```bash
curl <PIP_CHECKER_URL> > pip_check.py && python pip_check.py && rm pip_check.py
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.
