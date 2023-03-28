#### Setup Hudi CLI connect to MinIO in local without setup enviroment variables
---

- Fist step, you need to clone hudi responsitory from this github link [hudi responsitory](https://github.com/apache/hudi#build-with-different-spark-versions)
    - Build with spark which you are using. I'm using spark3.1.1
    ```
    # Build against Spark 3.1.x
    mvn clean package -DskipTests -Dspark3.1.1 -Dscala-2.12
    ```
- Second step:
    - creating core-site.xml in hudi-cli/conf with content:
    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

    <configuration>
        <property>
        <name>fs.s3a.endpoint</name>
        <value>http://localhost:9000</value>
        </property>
        <property>
        <name>fs.s3a.access.key</name>
        <value>admin</value>
        </property>
        <property>
        <name>fs.s3a.secret.key</name>
        <value>123456789</value>
        </property>
        <property>
        <name>fs.s3a.path.style.access</name>
        <value>true</value>
        </property>
        <property>
        <name>fs.s3a.aws.credentials.provider</name>
        <value>org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider</value>
    </property>
    </configuration>

    ```
    Note: you should replace `url`, `secret key` and `acess key` corresponding to your minio config
- Third step, adding path of core-site in hudi-env.sh file
- Fourth step, run `sh hudi-cli.sh` and try to connect to bucket in you minio.