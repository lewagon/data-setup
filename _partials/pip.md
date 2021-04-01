## Python packages

Now that we have a pristine `lewagon` virtual environment, it's time to install some packages in it.

First, let's upgrade `pip`, the tool to install Python Packages from [pypi.org](https://pypi.org). In the latest Ubuntu terminal where the virtualenv `lewagon` is activated, run:

```bash
pip install --upgrade pip
```

Then let's install some packages for the first weeks of the program:

```bash
pip install pytest pylint ipdb pyyaml nbresult autopep8 flake8 lxml yapf
```

Let's install packages useful for API & Scraping:

```bash
pip install requests bs4
```

Finally, more Data Science packages:

```bash
pip install jupyterlab pandas matplotlib seaborn plotly scikit-learn tensorflow nbconvert xgboost statsmodels pandas-profiling jupyter-resource-usage
```

### Packages check up

Run the following command to check if you successfully installed the required packages:
```bash
curl https://gist.githubusercontent.com/krokrob/2e5a61b20582b55bbb034c4ea1e9f633/raw/9648336201de2db5932bc6d02ad72ee0cb947992/pip_check.sh > pip_check.sh && zsh pip_check.sh && rm pip_check.sh
```

Now run the following command to check if you can load these packages:
```bash
curl https://gist.githubusercontent.com/krokrob/90e35dee7ed2b20852b099331510b369/raw/09178c49db6e7537eed68335a25fbb00c7ca1fd4/pip_check.py > pip_check.py && python pip_check.py && rm pip_check.py
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.
