# Create queue
aws --endpoint-url=http://127.0.0.1:4576 sqs create-queue --queue-name myqueue

# Create bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api create-bucket --bucket mybucket

# Add ACL (Acess Control List) rules to bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api put-bucket-acl --bucket mybucket --acl public-read

# Get QueueArn attribute and store in QUEUE_ARN variable
QUEUE_ARN=$(aws --endpoint-url=http://127.0.0.1:4576 sqs get-queue-attributes --queue-url http://localhost:4576/queue/myqueue --attribute-names All --output text --query 'Attributes.QueueArn')

# Copy notification_template.json file
cp notification_template.json notification.json

# Replace {{queueuArn}} by QUEUE_ARN variable value in notifications configuration JSON file
sed -i "s/{{queueArn}}/$QUEUE_ARN/g" notification.json

# Configure notification on bucket
aws --endpoint-url=http://127.0.0.1:4572 s3api put-bucket-notification-configuration --bucket mybucket --notification-configuration file://notification.json

# Sync local files to bucket
aws --endpoint-url=http://127.0.0.1:4572 s3 sync /root/s3/data s3://mybucket/