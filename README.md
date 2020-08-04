# Fragil Web

Portfolio made with Elm and KeystoneJS.

## Development

Development can be done with docker or by using npm tasks of each project.

### With docker

1. Install [docker desktop](https://docs.docker.com/desktop/) or [docker toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)
2. Make sure your [docker daemon](https://docs.docker.com/config/daemon/) is running
3. Start the dev server with (docker-compose)[docker-compose.yml]:

```
docker-compose up
```

This will start 3 services

- `elm`: Elm app (on port 8000), changes are reflected after refreshing the page
- `keystonejs`: KeystoneJS (on port 3000)
- `mongodb`: MongoDB server (on port 27017)

Depending on your docker installation, services will be available on `localhost` or trough the docker machine.

You can also initiate each service separately by:

```
docker-compose up <service_name> // e.g. docker-compose up elm
```

For more information, check [docker-compose.yml](docker-compose.yml) and the [Official docs](https://docs.docker.com/compose/compose-file/).

#### ENV Variables

TBD

### Manual

Each project will be initiated separate.

#### Frontend

Install elm 0.19

go to `/elm` and run `elm reactor`

for more information on how to build the app: https://guide.elm-lang.org/install/elm.html

#### Backend

It's required to provide a mongo db service on 27017.

Check mutations on the graphql playground
https://www.keystonejs.com/guides/intro-to-graphql#execution

[LINK_TO_KEYSTONEJS_README]
