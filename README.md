# Models for Enterprise Kanban

## Build the docker image
'''
docker build --tag ek_db .
docker run --detach --publish 5432:5432 --net enterprisekanban --name ek_db ek_db
'''

## Inspect the database
'''
docker run --detach --publish 5050:5050 --name pgadmin --net enterprisekanban --link ek_db:ek_db thajeztah/pgadmin4
'''
