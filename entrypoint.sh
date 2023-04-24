#!/bin/sh
# Since the api service is dependent not only on the container being up and running but 
# also the actual Postgres instance being up and healthy
echo "Waiting for postgres..."

while ! nc -z api-db 5432; do
  sleep 0.1
  # The loop continues until something like Connection to api-db port 5432 [tcp/postgresql] succeeded! is returned.
done

echo "PostgreSQL started"

python manage.py run -h 0.0.0.0