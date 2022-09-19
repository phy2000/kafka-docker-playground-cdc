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
## Show content of CUSTOMERS table:
```
$ ./showtables.sh
```

## Create the signal table
This creates the signal table so we can trigger incremental snapshots
```
./createsignal.sh
```
## Monitor the CDC topic for CUSTOMERS table
This will create an avro consumer to read the CDC stream from the customers table.
It will use a default consumer group unless overridden by command line
```
$ ./readtopic.sh [consumer-group]
```
## Send a signal to the connector to  take an incremental snapshot
```
$ ./sendsignal.sh
```

#  Details of what the base scripts are doing

### startall.sh

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



- Control Center is reachable at [http://127.0.0.1:9021](http://127.0.0.1:9021])
- PostgreSQL is reachable at [http://127.0.0.1:5432](http://127.0.0.1:5432])
- [DbVisualizer](https://www.dbvis.com) was used to examine and update the database.

