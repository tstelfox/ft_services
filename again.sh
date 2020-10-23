#!/bin/bash

"echo -n \"Available before:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4; unsetopt nomatch; rm -Rf ~/Library/*.42_cache_bak*; rm -Rf ~/*.42_cache_bak_*; setopt nomatch; echo -n \"Available after:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4;"
minikube stop
minikube delete
bash setup.sh