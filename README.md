# Models for Enterprise Kanban

## Build the docker image
'''
docker build --tag ek_db .
docker run --detach --publish 5432:5432 --name ek_db ek_db
'''
