#!/bin/bash

ami_id="ami-0055977a6e828a4f4"
instance-type="t3.micro"
domain-name="paleminvest.online"
hosted-zone="Z08132011Z2LFXPDOFD26"

for instance in $@
do
    echo "Creating Instance: $instance"
    instance_id=$(aws ec2 run-instances \
        --image-id $ami_id \
        --instance-type $instance_type \
        --security-groups "roboshop-common-SG" "roboshop-$instance-SG" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=roboshop-$instance}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )
    echo "$instance ID: $instance_id"
done
