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

## Deployment to heroku

### setup

- `$ heroku create # create app`
- `$ heroku container:login # login`
- `$ heroku addons:create heroku-postgresql:mini --app ancient-meadow-86425 # provision db`

### deploy

- `$ docker build -f Dockerfile.prod -t registry.heroku.com/ancient-meadow-86425/web .`
  - format is `registry.heroku.com/<app>/<process-type>`
- `$ docker push registry.heroku.com/ancient-meadow-86425/web:latest`
- `$ heroku container:release web --app ancient-meadow-86425`
  - release image
- still need to `$ heroku run python manage.py recreate_db --app ancient-meadow-86425`

## Code coverage and quality

### Coverage

- pytest-cov==4.0.0
- Add `.coveragerc` file
- `$ docker-compose exec api python -m pytest "src/tests" -p no:warnings --cov="src"`
- `$ docker-compose exec api python -m pytest "src/tests" -p no:warnings --cov="src" --cov-report html`
  - view html version

### Linting

- flake8==6.0.0
- pyflakes + pycodestyle
- `setup.cfg` file
- `$ docker-compose exec api flake8 src`

- black==23.1.0
- formatting
- `$ docker-compose exec api black src --check`
- `$ docker-compose exec api black src  --diff`
- `$ docker-compose exec api black src # apply`

- isort==5.12.0
- sort and section imports
- `$ docker-compose exec api isort src --check-only`
- `$ docker-compose exec api isort src --diff`
- `$ docker-compose exec api isort src # apply`
