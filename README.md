# Albatross

Albatross is a CMS for golf organisations.

## Getting Started

Albatross uses Docker to host the database. Ensure that Docker is installed and running.

```bash
$ docker-compose up
```

You'll need to add the following entries to your hosts file:

```
127.0.0.1 lvh.me
```

To run the application, you'll need to install the dependencies.

```bash
$ bundle install
```

Finally, you can run the application.

```bash
$ bundle exec rails s
```
