#!/bin/sh

# @see https://docs.docker.com/compose/django/

# whoami

# python --version

# pwd

# ls -lha /usr/src/app/

python /usr/src/app/manage.py migrate

python /usr/src/app/manage.py runserver 0.0.0.0:8000
