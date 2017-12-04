# Apache Spark Ansible Role
====================

# Installs Apache Spark
- Spark is a fast and general cluster computing system for Big Data. It provides high-level APIs in Scala, Java, Python, and R, and an optimized engine that supports general computation graphs for data analysis. It also supports a rich set of higher-level tools including Spark SQL for SQL and DataFrames, MLlib for machine learning, GraphX for graph processing, and Spark Streaming for stream processing.
- http://spark.apache.org/


Requires that you have java installed already, e.g. using
https://galaxy.ansible.com/wtanaka/oracle-java/

Example Playbook
----------------

    - hosts: servers
      roles:
         - role: wtanaka.apache-spark

License
-------

GPLv2


