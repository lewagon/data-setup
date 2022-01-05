
# using native terminal / brew / pyenv (no rosetta)

packages without arm builds
- (tensorflow)
- lxml
- xgboost
- statsmodel
- pmdarima
- deap
- gensim
- coverage
- psutil

packages with arm constraints
- python 3.10           pandas
- python 3.9            PyYAML
- macos 12_0 monterey   scikit-learn, scipy, scikit-image
- macos 11_0 big sur    tensorflow-macos

terminal    brew    pyenv   macos   python  sklearn     tensorflow                  outcome

arm         arm     arm     12_0    3.9.9   1.0.2

arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.7.0
arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.6.0
arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.5.0

arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.7.0
arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.6.0
arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.5.0

# using rosetta for terminal / brew / pyenv

packages with contraints
- tensorflow-macos      python 3.8

terminal    brew    pyenv   macos   python  sklearn     tensorflow                  outcome

rosetta     x86     x86     11_0    3.8.12              tensorflow-macos  2.7.0
rosetta     x86     x86     11_0    3.8.12              tensorflow-macos  2.6.0
rosetta     x86     x86     11_0    3.8.12              tensorflow-macos  2.5.0

rosetta     x86     x86     10_11   3.9.9               tensorflow        2.7.0
rosetta     x86     x86     10_11   3.8.12              tensorflow        2.7.0

rosetta     x86     x86     10_11   3.9.9               tensorflow        2.6.2
rosetta     x86     x86     10_11   3.8.12              tensorflow        2.6.2

rosetta     x86     x86     10_14   3.9.9               tensorflow        2.5.2
rosetta     x86     x86     10_14   3.8.12              tensorflow        2.5.2

``` bash
pyenv install 3.8.12
pyenv virtualenv 3.8.12 test
pyenv local test

pip install -U pip

pip install -r specs/generated/apple_silicon_full_raw.txt
pip freeze > specs/validated/apple_silicon_full_raw_rosetta_3.8.12_tf-macos_2.5_no_fbprophet.txt

pip install -r specs/generated/apple_silicon_full_raw_ordered.txt
pip freeze > specs/validated/apple_silicon_full_raw_ordered_rosetta_3.8.12_tf-macos_2.5_no_fbprophet.txt

pip install -r specs/generated/apple_intel_full_raw.txt
pip freeze > specs/validated/apple_intel_full_raw.txt

pip install -r specs/generated/apple_intel_full_raw_ordered.txt
pip freeze > specs/validated/apple_intel_full_raw_ordered.txt

# run all tests here

pyenv virtualenv-delete test
```
