import yaml

with open("test.yml", "r") as file:
    conf = yaml.safe_load(file)

print(conf["setup"])


def flatten(elements):

    flattened = []
    for e in elements:
        if isinstance(e, list):
            flattened += e
        else:
            flattened.append(e)

    # flattened = [e if isinstance(e, list) else [e] for e in elements]
    # flattened = [ee for e in flattened for ee in e]

    return flattened


print()
print(flatten(conf["setup"]))
