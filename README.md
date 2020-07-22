# Fragil Web

Portfolio made with elm with KeystoneJS as backend.

## Development

Development can't be done with different ways:

### With docker

Make sure your docker daemon is running

Start the development server based on (docker-compose)[docker-compose.yml].

```
docker-compose up
```

This will start 3 services

- elm, on port 8000, changes will be displayed after refreshing the app
- KeystoneJS
- mongodb

this will be available through the docker machine

You can also initiate each service separately by:

```
docker-compose up <service_name> // e.g. docker-compose up elm
```

for More information please refer to

#### env variables

### Manual

### Elm

Install elm 0.19

go to `/elm` and run `elm reactor`

for more information on how to build the app: https://guide.elm-lang.org/install/elm.html

### KeystoneJS

#### MOngo db

In case docker is not possible to use, yo

#### env variables
