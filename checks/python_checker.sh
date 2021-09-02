python_version=$(head -1 python_version.txt)
python_version=${python_version%"\n"}
my_python_version=$(python -V)
if [[ $my_python_version = *$python_version* ]];then
  echo "✅ Your Python version OK."
else
  echo "❌ Your Python version is $my_python_version but it should be $python_version."
fi
