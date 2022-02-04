#!/bin/zsh

# list unused images
# - checks for images not referenced in the content
# - does not assess missing references in the content
for file in images/*; do if [[ -z $(grep -rnw . -e $file G $file) ]]; then echo $file; fi; done
