#!/bin/bash
S3_BUCKET="web-config-scripts-bucket"
PLAYBOOK_FILE="config.yml"

sudo yum update -y
sudo yum install -y python3 pip

pip3 install ansible
pip3 install awscli

aws s3 cp s3://$S3_BUCKET/$PLAYBOOK_FILE /home/ec2-user/$PLAYBOOK_FILE
ansible-playbook /home/ec2-user/$PLAYBOOK_FILE >> /home/ec2-user/ansible-playbook-output.log 2>&1