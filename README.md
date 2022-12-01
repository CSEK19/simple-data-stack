# data-stack
Set up a data stack using Apache Spark standalone cluster with Docker containers.

# Getting Started

## Prerequisites

- Docker CE
- MySQL Client

## Installing

1. Clone this repo.
2. Open file `host`:

```
sudo vim /etc/hosts
```

- Add this line:

```
127.0.0.1 hadoop
```

3. Run Docker
```
docker-compose up -d
```

4. Send file data to Hadoop:
```
sh scripts/send-file.sh
```
- Check file on Hadoop: 
```
docker exec -it hadoop bash
hadoop fs -ls /test
```

5. Create a table in MySQL (if):
```
sh scripts/create-table.sh
```

# PySpark
Mounted `opt/workspace` to `./scripts` folder.

To interact with Spark:
- Open browser at [http://localhost:8888](http://localhost:8888) or
- Run any `*.ipynb` in `./scripts` folder.

Spark Web UI:
- [Spark Master - http://localhost:8080](http://localhost:8080)
- [Spark Worker 1 - http://localhost:8081](http://localhost:8081)
- [Spark Worker 2 - http://localhost:8082](http://localhost:8082)

# Note
This repo has been successfully run on Apple silicon M1. If you want to run it on another operating system without any problems, please modify the `docker-compose.yaml` file.
<!-- 
pyspark --driver-class-path mysql-connector-java-8.0.24.jar --jars mysql-connector-java-8.0.24.jar

docker exec -it hadoop bash
hadoop fs -ls /test -->
