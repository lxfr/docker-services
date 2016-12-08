#!/bin/bash
docker-compose -f backup.yml up
export $(cat .env | xargs)
docker restart $CONTAINER_VOLUMES_BACKUP