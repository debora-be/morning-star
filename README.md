# Morning Star

## Overview

Embark on a cosmic journey with Morning Star, your gateway to the celestial wonders of Venus! This application searches for breathtaking images of Venus and intertwining them with enthralling myths of love and beauty from Roman lore. Gaze upon the skies through the lens of NASA's finest, and delve into tales as old as time itself, all served in a sleek GraphQL API.

## Prerequisites

- Docker
- Docker Compose

## Setup

### Docker config

Our `Dockerfile` conjures up an Elixir environment as if by magic, while `docker-compose.yml` orchestrates a symphony of services, binding the Elixir app with the steadfast MariaDB for an unbreakable data duet.

## Running the application

To launch your space odyssey:

```bash
docker compose up --build -d
```

### Database initialization

Once upon a time, you'd manually set the stage for MariaDB:

```bash
docker exec -it mariadb mysql -u root -prootpassword
```

And with a flick of your wand (or keyboard), grant your Morning Star user full dominion:

```sql
GRANT ALL PRIVILEGES ON *.* TO 'morning_star'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

From this moment forth, step into the application's command center with:

```bash
docker exec -it morning_star ash
```

Now let Morning Star guide you through the cosmos and beyond at
`http://localhost:4000/v1/graphql/ui`

## Queries and expectations

```graphql
query GetVenusImages($startDate: String!, $endDate: String!) {
  getVenusImages(startDate: $startDate, endDate: $endDate) {
    dateCreated
    description
    imageUrl
    thatDailyMythologicalStuff
    title
  }
}
```

query variables

```json
{
  "startDate": "2021-01-01",
  "endDate": "2021-01-31"
}
```

sucess

![Screenshot from 2024-02-14 00-17-31](https://github.com/debora-be/morning-star/assets/72231462/c996b2cf-c71a-4104-97bd-9c06905af7c5)
