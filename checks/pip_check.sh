REQUIRED=('pytest' 'pylint' 'ipdb' 'PyYAML' 'nbresult' 'autopep8' 'flake8' 'yapf' 'lxml' 'requests' 'beautifulsoup4' 'jupyterlab' 'pandas' 'matplotlib' 'seaborn' 'plotly' 'scikit-learn' 'tensorflow' 'nbconvert' 'xgboost' 'statsmodels' 'jupyter-resource-usage')
PACKAGES=$(pip freeze)
PACKS=()
while read -r line; do
   PACKS+=("$line")
done <<< "$PACKAGES"
missing=()
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
  if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
    arch_name='m1'
  fi
elif [ "${arch_name}" = "arm64" ]; then
  arch_name='m1'
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
    fi
  done
  if (($present == 0))
  then
    missing+=($r)
  fi
done
if (( ${#missing[@]} )); then
  sentence='Try to `pip install '
  sentence+=$missing
  sentence+='` again.'
  echo '❌ Some packages are missing:'
  echo $sentence
else
  echo '✅ Everything is fine, continue the setup instructions.'
fi
