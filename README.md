# Morning Star
## Overview

Morning Star is an Elixir-based web application designed to fetch and store astronomical data. The project uses Phoenix for the web framework and MariaDB for data persistence, all running within Docker containers.

## Prerequisites

- Docker
- Docker Compose

## Setup

### Docker configuration

`Dockerfile` sets up the Elixir environment.
`docker-compose.yml` orchestrates the Elixir app and MariaDB service setup.

## Running the application

Start the project with:

```bash
docker compose up --build -d
```

### Database initialization

These manual steps are required only once to set up the MariaDB user:

* Access the MariaDB Docker container:

```bash
docker exec -it mariadb mysql -u root -prootpassword
```

* Grant the necessary permissions to the morning_star user:

```sql
GRANT ALL PRIVILEGES ON morning_star_dev.* TO 'morning_star'@'%';
FLUSH PRIVILEGES;
```

* From now on, the applications`s shell can be accessed with:

```bash
docker exec -it morning_star bash
```