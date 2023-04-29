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

  - Adds model to dev db

- `$ docker-compose exec api-db psql -U postgres`

## Latest

- Delete container
- `$ docker-compose up -d`
- `$ docker-compose exec api python -m pytest "src/tests"`
- `$ docker-compose exec api python manage.py recreate_db`
  - create dev db
  - `http://localhost:5004/users` shows no users
- `$ docker-compose exec api python manage.py seed_db`
  - Adds users

## Pytest commands

```bash
# normal run
$ docker-compose exec api python -m pytest "src/tests"

# disable warnings
$ docker-compose exec api python -m pytest "src/tests" -p no:warnings

# run only the last failed tests
$ docker-compose exec api python -m pytest "src/tests" --lf

# run only the tests with names that match the string expression
$ docker-compose exec api python -m pytest "src/tests" -k "config and not test_development_config"

# stop the test session after the first failure
$ docker-compose exec api python -m pytest "src/tests" -x

# enter PDB after first failure then end the test session
$ docker-compose exec api python -m pytest "src/tests" -x --pdb

# stop the test run after two failures
$ docker-compose exec api python -m pytest "src/tests" --maxfail=2

# show local variables in tracebacks
$ docker-compose exec api python -m pytest "src/tests" -l

# list the 2 slowest tests
$ docker-compose exec api python -m pytest "src/tests" --durations=2
```
