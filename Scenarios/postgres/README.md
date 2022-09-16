# Scenario: Debezium PostgreSQL source connector + PostgreSQL JDBC source + PostgreSQL JDBC sink



## Objective

Testbed for CDC onboarding at Accenture

## How to run

Run start script

```
$ ./startall.sh
```
## How to stop
Run stop script
```
$ ./stop.sh
```

##  Details of what the script is doing

This will create a single broker cluster with the following components:
- Kafka Connect with
  - Debezium PostgreSQL source
  - Postgres JDBC source
  - Postgres JDBC sink
- ksqlDB server
- Schema Registry
- ksqlDB CLI
- PostgreSQL database
- kcat
- grafana and prometheus
  - kafka dashboards
  - alert manager
- lightbend/lag exporter

The database logins are
- User: myuser
- Password: mypassword

See the original examples: 
- [Debezium PostgreSQL](../../connect/connect-debezium-postgresql-source)
- [JDBC PostgreSQL source](../../connect/connect-jdbc-postgresql-source)
- [JDBC PostgreSQL sink](../../connect/connect-jdbc-postgresql-sink)

Show content of CUSTOMERS table:


- Control Center is reachable at [http://127.0.0.1:9021](http://127.0.0.1:9021])
- PostgreSQL is reachable at [http://127.0.0.1:5432](http://127.0.0.1:5432])
- [DbVisualizer](https://www.dbvis.com) was used to examine and update the database.

