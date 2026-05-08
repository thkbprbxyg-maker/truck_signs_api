# Truck Signs API

## Table of Contents
- [Description](#description)
- [Quickstart](#quickstart)
- [Requirements](#requirements)
- [Environment Variables](#environment-variables)

## Description
Truck Signs API is a Django REST API for managing truck sign designs. 
It uses a PostgreSQL database and runs in a Docker container on port 8020.

## Quickstart

### Requirements
- Docker
- Docker Compose

### Setup
1. Clone the repository:
   git clone https://github.com/thkbprbxyg-maker/truck_signs_api.git
   cd truck_signs_api

2. Create your .env file:
   cp .env.example .env

3. Start the containers:
   docker-compose up --build

4. The API is now available at:
   http://localhost:8020

## Environment Variables
All sensitive configuration is stored in a `.env` file.
Never commit this file to Git.

| Variable | Description |
|----------|-------------|
| POSTGRES_DB | Database name |
| POSTGRES_USER | Database user |
| POSTGRES_PASSWORD | Database password |
| SECRET_KEY | Django secret key |
| DEBUG | Debug mode (0=off, 1=on) |