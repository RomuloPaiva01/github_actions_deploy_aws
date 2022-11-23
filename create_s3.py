import boto3
import os

#
# create s3 bucket
s3_client = boto3.client('s3',
                            aws_access_key_id=os.environ["AWS_ACCESS_KEY_ID"],
                            aws_secret_access_key=os.environ["AWS_SECRET_ACCESS_KEY"],
                            region_name="eu-region-01")

_ = s3_client.create_bucket(Bucket="romulo-amaral-bucket-codepipeline",
                            CreateBucketConfiguration={'LocationConstraint': "eu-region-01"})
