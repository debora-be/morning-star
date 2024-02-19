# Morning Star

## Overview

Embark on a cosmic journey with Morning Star, your gateway to the celestial wonders of Venus! This application searches for breathtaking images of Venus and intertwining them with enthralling myths of love and beauty from the Roman lore and its medieval interpretations. Gaze upon the skies through the lens of NASA's finest, and delve into tales as old as time itself, all served in a sleek GraphQL API.

Once the application is running, you can access it in browser; each time we hit F5, a new image of Venus and a new story to go with it. We call [Astronomy Picture of the Day](https://api.nasa.gov/) API to fetch the images and academic papers to bring related stories.

## Prerequisites

- Docker
- Docker Compose

## Running the application

```bash
docker compose up --build -d
```

And now we got it all working out together! Access it in your browser at
`http://localhost:3000`

![Screenshot from 2024-02-18 20-09-35](https://github.com/debora-be/morning-star/assets/72231462/96fad7f4-e56b-4feb-a810-8ad4f7d27fe1)

### Running tests

```bash
docker compose run morning_star_test mix test
```

### Tiny details

When we try to query for recent images, we might not get any response. This is because the NASA API does not have any recent images of Venus. Every single image was worshiped and adored, and now they are all gone. We can only hope that the next image will be as beautiful as the ones we have seen so far.

The article that is returned in the response comes from [SciHub](https://sci-hub.wf/10.2307/27707955).
