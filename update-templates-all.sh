#!/bin/bash

#SYNTAX - update-templates-all.sh PACKAGE
#Updates ALL non-admin user domain templates to the package specified.

if [ -z ${1+x} ]; then echo "ERROR: Template to change to needs to be specified"; exit 1; fi

for X in /home/*; do
        user=${X#/home/}
        if [ $user != "admin" ]; then
                if [ "$(ls -A /home/$user/web)" ]; then
                        for domain in /home/$user/web/*; do
                                stripped=${domain#/home/$user/web/}
                                echo Changing template of domain $stripped
                                /usr/local/vesta/bin/v-change-web-domain-tpl $user $stripped $1
                        done
                fi
        fi
done
