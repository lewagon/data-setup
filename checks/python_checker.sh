my_python_version=$(python -V)
if [[ $my_python_version = *$0* ]];then
  echo "✅ Your Python version OK."
else
  echo "❌ Your Python version is $my_python_version but it should be $0."
  exit 1
fi
