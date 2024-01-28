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

### Database initialization

These manual steps are required once to set up the MariaDB user:

* Access the MariaDB Docker container:

```bash
docker exec -it mariadb mysql -u root -prootpassword
```

* Grant the necessary permissions to the morning_star user:

```sql
GRANT ALL PRIVILEGES ON morning_star_dev.* TO 'morning_star'@'%';
FLUSH PRIVILEGES;
```

## Running the application

Start the project using Docker Compose:

```bash
docker compose up --build
```

The application will be accessible at http://localhost:4000