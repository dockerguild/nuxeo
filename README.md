# Nuxeo with Docker

Starter kit, fork me for use.

## Requirements

 - Nginx

## Installation

    make install

## Data persistence

Into docker-compose.yml, comment lines 

    #volumes:
    #  - ./data/app:/var/lib/nuxeo/data

Restart docker

    make restart

Copy data

    docker cp nuxeo_app_live:/var/lib/nuxeo/data data/app

Into docker-compose.yml, uncomment lines

    volumes:
      - ./data/app:/var/lib/nuxeo/data

Restart docker

    make restart

## Usage

Start containers

    make start

Restart containers

    make restart

Down containers

    make down

Update containers

    make update
