# Readme

## Run w/o docker

- `$ export FLASK_APP=src/__init__.py`
- `$ export FLASK_DEBUG=1`
- `$ python manage.py run`

## Run with docker

- https://testdriven.io/blog/docker-best-practices/
- `$ docker-compose build`
- `$ docker-compose up -d`
- `$ docker-compose up -d --build # update container`
- After adding create_app
- `$ docker-compose up -d && docker-compose exec api flask shell`

## Testing

- `$ docker-compose exec api python -m pytest "src/tests"`
- `$ docker-compose exec api python -m pytest "src/tests" -k config`
  - only run tests with config in their names
- https://testdriven.io/blog/pytest-for-beginners/
- pytest will autodiscover test files that start or end with test -- i.e., test\*_.py or _\_test.py. Test functions must begin with test\*, and if you want to use classes they must also begin with Test.
- Fixtures are reusable objects for tests. They have a scope associated with them, which indicates how often the fixture is invoked:
  - function - once per test function (default)
  - class - once per test class
  - module - once per test module
  - session - once per test session
  - https://testdriven.io/blog/flask-pytest/
- pytest tests are just functions that either start or end with test

- `$ docker-compose exec api python manage.py recreate_db`
  - Adds model to dev db
- `$ docker-compose exec api-db psql -U postgres`

## Latest

- `$ docker-compose up -d`
- `$ docker-compose exec api python -m pytest "src/tests"`
- `$ docker-compose exec api python -m pytest "src/tests" --lf`
  - Only re-running tests that failed during last run

https://testdriven.io/courses/tdd-flask/restful-routes/
