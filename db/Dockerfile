FROM postgres:10

# postgres container autmatically loads db dumps here on startup.
ADD ./db/superset_data.sql /docker-entrypoint-initdb.d/superset_data.sql

# Add dump and load scripts to path.
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/db
