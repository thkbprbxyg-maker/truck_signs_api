#!/usr/bin/env bash
set -e

echo "Waiting for postgres to connect ..."

while ! python -c "import socket; s=socket.socket(); s.connect(('db', 5432))" 2>/dev/null; do
  sleep 0.1
done

echo "PostgreSQL is active"

python manage.py migrate
python manage.py collectstatic --noinput

gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8020

echo "Server started"