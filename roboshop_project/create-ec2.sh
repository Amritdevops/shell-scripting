#!/bin/bash

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z "${AMI_ID}" ]; then
  echo -e"\e[1;31munable to find the Image AMI_ID\e[0m"
else
  echo "AMI_ID = ${AMI_ID}"
fi
