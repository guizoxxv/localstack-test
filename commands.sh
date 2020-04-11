# Create bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api create-bucket --bucket mybucket

# List buckets
aws --endpoint-url=http://127.0.0.1:4572 s3api list-buckets

# Add ACL (Acess Control List) rules to bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api put-bucket-acl --bucket mybucket --acl public-read

# Configure notification on bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api put-bucket-notification-configuration --bucket mybucket --notification-configuration file://notification.json

# Create queue
aws --endpoint-url=http://127.0.0.1:4576 sqs create-queue --queue-name myqueue

# List queues
aws --endpoint-url=http://127.0.0.1:4576 sqs list-queues

# Get queue attributes and query ARN (Amazon Resource Name) value
aws --endpoint-url=http://127.0.0.1:4576 sqs get-queue-attributes --queue-url http://localhost:4576/queue/myqueue --attribute-names All --output text --query 'Attributes.QueueArn'

# Copy local object to bucket
aws --endpoint-url=http://127.0.0.1:4572 s3 cp sample.jpg s3://mybucket/

# List bucket files
aws --endpoint-url=http://127.0.0.1:4572 s3 ls s3://mybucket

# Get queue messages
aws --endpoint-url=http://127.0.0.1:4576 sqs receive-message --queue-url http://localhost:4576/queue/myqueue --attribute-names All --message-attribute-names All --max-number-of-messages 10

# Sync local files to bucket
aws --endpoint-url=http://127.0.0.1:4572 s3 sync /root/localstack/s3 s3://mybucket/