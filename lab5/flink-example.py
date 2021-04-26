from time import time

sink_path = 'results' + str(time())
st_env \
    .connect(  # declare the external system to connect to
        Kafka()
        .version("universal")
        .topic("weblog")
        .start_from_earliest()
        .property("zookeeper.connect", "kafka:2181")
        .property("bootstrap.servers", "kafka:9092")
    ) \
    .with_format(  # declare a format for this system
        Csv()
        .schema(DataTypes.ROW([DataTypes.FIELD("time",DataTypes.TIMESTAMP(3)),
            DataTypes.FIELD("IP",DataTypes.STRING()),
            DataTypes.FIELD("code",DataTypes.BIGINT()),
            DataTypes.FIELD("op",DataTypes.STRING()),
            DataTypes.FIELD("URL",DataTypes.STRING()),
            DataTypes.FIELD("dur",DataTypes.FLOAT())]))
        .field_delimiter(',')
    ) \
    .with_schema(  # declare the schema of the table
        Schema()
        .field("time", DataTypes.TIMESTAMP(3))
        .field("IP", DataTypes.STRING())
        .field("code", DataTypes.BIGINT())
        .field("op", DataTypes.STRING())
        .field("URL", DataTypes.STRING())
        .field("dur", DataTypes.FLOAT())
    ) \
    .create_temporary_table("WebLog")
    
st_env.connect(FileSystem().path(sink_path))  \
    .with_format(
        Csv()
        .field_delimiter(',')
    )\
    .with_schema(
        Schema()
        .field("IP", DataTypes.STRING())
        .field("count", DataTypes.BIGINT())
    ) \
    .create_temporary_table("stream_sink")
    
t = st_env.from_path('WebLog') \
    .select('IP, code') \
    .insert_into('stream_sink')
st_env.execute("stream_job")


