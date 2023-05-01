#!/bin/sh

if [ "$MYSQL_DATABASE" = "django_app" ]
then
    echo "Waiting for django_app..."

    while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
      sleep 0.1
    done

    echo "MYSQL started"
fi

python manage.py flush --no-input
python manage.py migrate

exec "$@"