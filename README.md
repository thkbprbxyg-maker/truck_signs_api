# Truck Signs API

## Table of Contents
- [Description](#description)
- [Quickstart](#quickstart)
  - [Requirements](#requirements)
  - [Clone the Repository](#clone-the-repository)
  - [Create Environment File](#create-environment-file)
  - [How to Build the Image](#how-to-build-the-image)
  - [Create the Network](#create-the-network)
  - [Start the Database](#start-the-database)
  - [Start the API](#start-the-api)
  - [Usage](#usage)

## Description
Truck Signs API is a Django REST API for managing truck sign designs.
It uses a PostgreSQL database running in a separate container and is accessible on port 8020.

## Quickstart

### Requirements
- Docker installed on your machine

### Clone the Repository
```bash
git clone git@github.com:thkbprbxyg-maker/truck_signs_api.git
cd truck_signs_api
```

### Create Environment File
```bash
cp .env.example .env
```
Edit the `.env` file and fill in your values.

### How to Build the Image
```bash
docker build -t truck_signs_api .
```

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
  --env-file .env \
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

### Usage
The API is accessible at `http://<your-ip>:8020`

Available endpoints:
- `/truck-signs/products/`
- `/truck-signs/categories/`
- `/admin/`