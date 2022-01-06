
# TODO v1

## apple silicon setup

- [x] cannot remove rosetta because of packages without arm builds
- [x] x86 tensorflow 2.7.0 => kernel dies
- [x] x86 tensorflow 2.6.0 => kernel dies
- [x] x86 tensorflow 2.5.0 => kernel dies
- [x] x86 tensorflow-macos 2.7.0 => kernel dies
- [x] x86 tensorflow-macos 2.6.0 => weird error https://stackoverflow.com/questions/69694944/how-to-fix-error-cannot-register-2-metrics-with-the-same-name-tensorflow-api
- [x] x86 tensorflow-macos 2.5.0 => ok
- [x] x86 tensorflow-macos requires python 3.8 => python 3.8.12

- [x] validate package version diff x86 tensorflow 2.7 vs arm tf-macos 2.5

- [x] validate package version diff depending on order in requirements.txt

- [ ] find subset of packages for sklearn 1.0.2 + tf 2.7

- [ ] check package version depending on install order


- [ ] python 3.8.12 no package version constraints

- [ ] check install conflits
- [ ] run challenges : make qui lance tous les exos (teste glovebox)
```
requests.exceptions.SSLError: HTTPSConnectionPool(host='opengraph.lewagon.com', port=443): Max retries exceeded with url: /?url=https%3A%2F%2Fwww.lewagon.com (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate has expired (_ssl.c:1131)')))
```

- [ ] does tensorflow work with rosetta ? or need tensorflow-macos ?
- [ ] run notebooks : deep learning day 1-2


- [ ] py 3.9 + tf 2.7 native / notebooks deep learning day 1-2



- [ ] run les warmup ?

- [ ] update data setup
- [ ] check.sh : gérer les up/downcase

- [ ] install all packages at setup day

- [ ] use full versions

- [ ] self referencing yaml

- [ ] setup versions on apple intel
- [ ] setup versions on apple silicon
- [ ] setup versions on windows 10
- [ ] setup versions on windows 11
- [ ] setup versions on linux
- [ ] setup versions for glovebox

- [ ] tester terminal sans Rosetta https://teamwagon.slack.com/archives/GNQEAFPPD/p1641291599004000?thread_ts=1641288772.002200&cid=GNQEAFPPD
- [ ] lister apps M1 natives ?

- [ ] récupérer la partial https://github.com/lewagon/setup/blob/master/_partials/macos_apple_silicon.md

- [ ] remove `pip install --upgrade scikit-learn` from data-*
- [ ] remove all -U from pip install in solutions + lectures


``` bash
pip install -U pip
pip install -r https://.../data-setup/specs/generated/${WAGON_PLATFORM}.txt
```

- [ ] update data-setup keep current for exams

- [ ] update setup to use info from generated files

- [ ] update setup checks to use info from generated files

- [ ] decommission https://gist.githubusercontent.com/krokrob/53ab953bbec16c96b9938fcaebf2b199/raw/9035bbf12922840905ef1fbbabc459dc565b79a3/minimal_requirements.txt

- [ ] update glovebox to source/duplicate the info from generated files
      - remove the usage of branches https://github.com/lewagon/data-runner/branches
      - update the image release process https://github.com/lewagon/data-runner/releases

- [ ] what about glovebox exam images ?

- [ ] move exams to latest conf (pickles)

# TODO later

- [ ] ajouter des vars d'env actionnables
      - Kitt available / YOUR_GITHUB_NICKNAME
      - WAGON_PYTHON_VERSION, WAGON_PLATFORM
