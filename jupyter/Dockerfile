FROM openjdk:8-jdk-slim
ARG shared_workspace=/opt/workspace
ARG spark_version=3.0.0
ARG hadoop_version=2.7
ARG jupyterlab_version=2.1.5

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get update -y && \
#     apt-get install -y curl && \
#     apt-get install -y unzip && \
#     apt-get install -y wget && \
#     curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
#     tar -xf spark.tgz && \
#     mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
#     mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
#     rm spark.tgz

# ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
# ENV SPARK_MASTER_HOST spark-master
# ENV SPARK_MASTER_PORT 7077
# ENV PYSPARK_PYTHON python3

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} && \
    pip3 install mysql-connector-python && \
    pip3 install findspark

# WORKDIR ${SPARK_HOME}
# RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.24.zip && \
#     unzip mysql-connector-java-8.0.24.zip

# RUN bin/pyspark --driver-class-path ./mysql-connector-java-8.0.24/mysql-connector-java-8.0.24.jar --jars ./mysql-connector-java-8.0.24/mysql-connector-java-8.0.24.jar

EXPOSE 8888
WORKDIR /
WORKDIR ${SHARED_WORKSPACE}

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=