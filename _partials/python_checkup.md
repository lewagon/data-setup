### Python setup check up

Check your Python version with the following commands:
```bash
sh -c "$(curl -fsSL <PYTHON_CHECKER_URL>)" <PYTHON_VERSION>
```

Run the following command to check if you successfully installed the required packages:
```bash
sh -c "$(curl -fsSL <PIP_CHECKER_URL>)"
```

Now run the following command to check if you can load these packages:
```bash
python -c "$(curl -fsSL <PIP_LOADER_URL>)"
```

That's it for today. During the bootcamp, we'll install more packages but we'll talk about that later.
