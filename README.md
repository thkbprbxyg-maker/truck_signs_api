# Truck Signs API

## Table of Contents
- [Description](#description)
- [Quickstart](#quickstart)
- [How to Build the Image](#how-to-build-the-image)
- [Usage](#usage)

## Description
Truck Signs API is a Django REST API for managing truck sign designs.
It uses a PostgreSQL database and runs on port 8020.

## Quickstart

### Requirements
- Docker installed on your machine

### Clone the Repository
```bash
git clone git@github.com:thkbprbxyg-maker/truck_signs_api.git
cd truck_signs_api
```

### How to Build the Image
```bash
docker build -t truck_signs_api .
```

## Usage

### Create the Network
```bash
docker network create truck_signs_network
```

### Start the Database
```bash
docker run -d \
  --name db \
  --network truck_signs_network \
  --restart always \
  -e POSTGRES_DB=${POSTGRES_DB} \
  -e POSTGRES_USER=${POSTGRES_USER} \
  -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
  -v truck_signs_data:/var/lib/postgresql/data \
  postgres:15
```

### Start the API
```bash
docker run -d \
  --name truck_signs_api \
  --network truck_signs_network \
  --restart always \
  -p 8020:8020 \
  --env-file .env \
  truck_signs_api
```

### Environment Variables
Create a `.env` file with the following variables:

```
DOCKER_SECRET_KEY=your-secret-key
DOCKER_DB_NAME=truck_signs
DOCKER_DB_USER=postgres
DOCKER_DB_PASSWORD=your-password
DOCKER_DB_HOST=db
DOCKER_DB_PORT=5432
POSTGRES_DB=truck_signs
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your-password
DOCKER_STRIPE_PUBLISHABLE_KEY=your-stripe-key
DOCKER_STRIPE_SECRET_KEY=your-stripe-secret
DOCKER_CLOUD_NAME=your-cloud-name
DOCKER_API_KEY=your-api-key
DOCKER_API_SECRET=your-api-secret
DOCKER_EMAIL_HOST_USER=your-email
DOCKER_EMAIL_HOST_PASSWORD=your-email-password
```