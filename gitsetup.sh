#!/bin/bash

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa2
ssh -T git@github.com
git remote -v
git remote set-url origin git@github.com:kiosksp002/loja.git
git remote -v



