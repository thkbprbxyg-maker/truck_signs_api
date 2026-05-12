# Truck Signs API

Truck Signs API is a Django REST API for managing truck sign designs.
It uses a PostgreSQL database running in a separate container and is accessible on port 8020.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Clone the Repository](#clone-the-repository)
- [Create Environment File](#create-environment-file)
- [How to Build the Image](#how-to-build-the-image)
- [Create the Network](#create-the-network)
- [Start the Database](#start-the-database)
- [Start the API](#start-the-api)
- [Usage](#usage)

## Prerequisites
- Docker installed on your machine

## Clone the Repository
```bash
git clone git@github.com:thkbprbxyg-maker/truck_signs_api.git
cd truck_signs_api
```

## Create Environment File
```bash
cp .env.example .env
```
Edit the `.env` file and fill in your values.

## How to Build the Image
```bash
docker build -t truck_signs_api .
```

## Create the Network
```bash
docker network create truck_signs_network
```

## Start the Database
```bash
docker run -d \
  --name db \
  --network truck_signs_network \
  --restart always \
  --env-file .env \
  -v truck_signs_data:/var/lib/postgresql/data \
  postgres:15
```

## Start the API
```bash
docker run -d \
  --name truck_signs_api \
  --network truck_signs_network \
  --restart always \
  -p 8020:8020 \
  --env-file .env \
  truck_signs_api
```

## Usage

The API is accessible at `http://<your-ip>:8020`

### Available Endpoints
- `GET /truck-signs/products/` - List all products
- `GET /truck-signs/categories/` - List all categories
- `GET /truck-signs/product-color/` - List all product colors
- `GET /admin/` - Django admin panel

### Configuration
You can modify the following environment variables in your `.env` file:

| Variable | Description | Default |
|----------|-------------|---------|
| `DOCKER_SECRET_KEY` | Django secret key | - |
| `DOCKER_DB_NAME` | Database name | truck_signs |
| `DOCKER_DB_USER` | Database user | postgres |
| `DOCKER_DB_PASSWORD` | Database password | - |
| `DOCKER_DB_HOST` | Database host | db |
| `DOCKER_DB_PORT` | Database port | 5432 |
| `ALLOWED_HOSTS` | Allowed hosts | localhost |

### Restart Policy
The containers use `--restart always` which means they will automatically restart if they crash or if the Docker daemon restarts.