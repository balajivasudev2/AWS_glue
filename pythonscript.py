import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue import DynamicFrame


def sparkSqlQuery(glueContext, query, mapping, transformation_ctx) -> DynamicFrame:
    for alias, frame in mapping.items():
        frame.toDF().createOrReplaceTempView(alias)
    result = spark.sql(query)
    return DynamicFrame.fromDF(result, glueContext, transformation_ctx)


args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext().getOrCreate()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node S3 bucket
S3bucket_node1 = glueContext.create_dynamic_frame.from_options(
    format_options={"quoteChar": '"', "withHeader": True, "separator": ","},
    connection_type="s3",
    format="csv",
    connection_options={"paths": ["s3://my-source-bucket-data/"], "recurse": True},
    transformation_ctx="S3bucket_node1",
)

# Script generated for node SQL Query
SqlQuery0 = """
select * from myDataSource AS d where d.Ozone!='null' AND d.Solar!='null'
"""
SQLQuery_node1687787831794 = sparkSqlQuery(
    glueContext,
    query=SqlQuery0,
    mapping={"myDataSource": S3bucket_node1},
    transformation_ctx="SQLQuery_node1687787831794",
)

# Script generated for node Amazon S3
AmazonS3_node1687787987769 = glueContext.write_dynamic_frame.from_options(
    frame=SQLQuery_node1687787831794,
    connection_type="s3",
    format="csv",
    connection_options={
        "path": "s3://my-destination-bucket-data/",
        "partitionKeys": [],
    },
    transformation_ctx="AmazonS3_node1687787987769",
)

job.commit()
