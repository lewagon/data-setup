REQUIRED=('pytest' 'pylint' 'ipdb' 'PyYAML' 'nbresult' 'autopep8' 'flake8' 'yapf' 'lxml' 'requests' 'beautifulsoup4' 'jupyterlab' 'pandas' 'matplotlib' 'seaborn' 'plotly' 'scikit-learn' 'tensorflow' 'nbconvert' 'xgboost' 'statsmodels' 'jupyter-resource-usage')
PACKAGES=$(pip freeze)
PACKS=()
while read -r line; do
   PACKS+=("$line")
done <<< "$PACKAGES"
missing=()
arch_name="$(uname -m)"
if [[ $OSTYPE == 'darwin'* ]]
then
  if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
      arch_name='m1'
    fi
  elif [ "${arch_name}" = "arm64" ]; then
    arch_name='m1'
  fi
fi
if [ $arch_name = 'm1' ]; then
  REQUIRED=('pytest' 'pylint' 'ipdb' 'PyYAML' 'nbresult' 'autopep8' 'flake8' 'yapf' 'lxml' 'requests' 'beautifulsoup4' 'jupyterlab' 'pandas' 'matplotlib' 'seaborn' 'plotly' 'scikit-learn' 'tensorflow-macos' 'nbconvert' 'xgboost' 'statsmodels' 'jupyter-resource-usage')
fi
for r in ${REQUIRED[@]}; do
  echo $r
  present=0
  for p in ${PACKS[@]}; do
    if (($present == 0)); then
      q=${p//==[0-9|\.]*/}
      if [ $r = ${q} ]; then
        present=1
      fi
      if [ $r = 'tensorflow' ]; then
        if [ 'tensorflow-cpu' = $q ]; then
          present=1
        fi
      fi
    fi
  done
  if (($present == 0))
  then
    missing+=($r)
  fi
done
if (( ${#missing[@]} )); then
  sentence='❌ Some packages are missing: '
  sentence+=$missing
  echo $sentence
  echo '👉 Ask a TA for help to check your python setup.'
  echo '   Note to TAs: First thing to do: redo the Python packages step of the instructions.'
  exit 1
else
  echo '✅ Everything is fine, continue the setup instructions.'
fi
