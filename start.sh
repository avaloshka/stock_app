#!/bin/sh

cd /app

echo "----- Collect static files ------ " 
python3 manage.py collectstatic --noinput

echo "-----------Apply migration--------- "
python3 manage.py makemigrations 
python manage.py migrate

echo "-----------Run gunicorn--------- "
gunicorn -b :5000 myapp.wsgi:application