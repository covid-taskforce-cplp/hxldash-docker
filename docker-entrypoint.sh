#!/bin/sh

# @see https://docs.docker.com/compose/django/

# whoami

# python --version

# pwd

# ls -lha /usr/src/app/

python /usr/src/app/manage.py migrate

# Note: This is likely to reset the database, change it later to be optional
#       see https://github.com/SimonbJohnson/quickX3/issues/69
python /usr/src/app/manage.py populate_database

python /usr/src/app/manage.py runserver 0.0.0.0:8000
