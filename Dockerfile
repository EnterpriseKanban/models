FROM postgres:9.6.1

ENV POSTGRES_DB=enterprisekanban

RUN apt-get update -qq && \
    apt-get install -y postgresql-contrib

ADD *.sql /docker-entrypoint-initdb.d/
