#!/bin/sh

whoami

python --version

pwd

ls -lha /usr/src/app/

python /usr/src/app/manage.py migrate

python /usr/src/app/manage.py runserver
