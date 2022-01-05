
# tests

packages without arm builds
- statsmodel

scikit-learn only supports arm from scikit-learn 1.0.2 + macos monterey 12_0

terminal    brew    pyenv   macos   python  sklearn     tensorflow                  outcome

arm         arm     arm     12_0    3.9.9   1.0.2

arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.7.0
arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.6.0
arm         arm     arm     11_0    3.9.9               tensorflow-macos  2.5.0

arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.7.0
arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.6.0
arm         arm     arm     11_0    3.8.12              tensorflow-macos  2.5.0

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
pyenv install 3.9.9
pyenv virtualenv 3.9.9 test
pyenv local test

pip install -U pip
pip install scikit-learn
pip install -r specs/generated/apple_silicon_full_raw.txt

# run all tests here

pip freeze > specs/validated/apple_silicon_full_raw_3.9.9_no_rosetta_but_tf-macos.txt

pyenv virtualenv-delete test
```
