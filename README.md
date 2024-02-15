# Morning Star

## Overview

Embark on a cosmic journey with Morning Star, your gateway to the celestial wonders of Venus! This application searches for breathtaking images of Venus and intertwining them with enthralling myths of love and beauty from the Roman lore and its medieval interpretations. Gaze upon the skies through the lens of NASA's finest, and delve into tales as old as time itself, all served in a sleek GraphQL API.

## Prerequisites

- Docker
- Docker Compose

## Setup

### Docker config

Our `Dockerfile` conjures up its environment as if by magic, while `docker-compose.yml` orchestrates a symphony of services, binding the Elixir app with the steadfast MariaDB for an unbreakable data duet.

## Running the application

To ship our next story:

```bash
docker compose up --build -d
```

### Database initialization

Once upon a time, you'd manually set the stage for MariaDB:

```bash
docker exec -it mariadb mysql -u root -prootpassword
```

And with a flick of our keyboard, grant your Morning Star user full dominion:

```sql
GRANT ALL PRIVILEGES ON *.* TO 'morning_star'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

Exit db shell; from this moment forth, step into the application's command center with:

```bash
docker compose up -d && docker exec -it morning_star ash
```

We just achieved the realms of response, _a.k.a_
`http://localhost:4000/v1/graphql/ui`

## Queries and expectations

```graphql
query getVenusImage($startDate: String!, $endDate: String!) {
  getVenusImage(startDate: $startDate, endDate: $endDate) {
    dateCreated
    description
    imageUrl
    thatDailyMythologicalStuff
    title
  }
}
```s

query variables

```json
{
  "startDate": "1999-06-12",
  "endDate": "3056-12-31"
}
```

success

![Screenshot from 2024-02-14 20-59-27](https://github.com/debora-be/morning-star/assets/72231462/996d0b37-7666-45a4-8fe2-402c34db5cb1)

### Running tests

```bash
docker compose run morning_star_test mix test
```

### Tiny details

When we try to query for recent images, we might not get any response. This is because the NASA API does not have any recent images of Venus. Every single image was worshiped and adored, and now they are all gone. We can only hope that the next image will be as beautiful as the ones we have seen so far.

The article that is returned in the response comes from [SciHub](https://sci-hub.wf/10.2307/27707955).
