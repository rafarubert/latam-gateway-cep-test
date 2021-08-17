# API Consulta CEP

https://github.com/latamgateway/interview


## Dependencies
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Run docker without sudo(linux user only)](https://docs.docker.com/engine/install/linux-postinstall/)

## Run project

### Before run
Add into .bashrc or .zshrc

```
export UID
export USER
```

```cp .env.sample .env```

## Build project
    docker-compose build

## Create Database
    docker-compose run --rm app bundle exec rake db:create

### run Project
    docker-compose up

### run project console
    docker-compose run --rm app bundle exec rails c

### run tests
    docker-compose run --rm app bundle exec spec

### run linux shell
    docker-compose run --rm app sh