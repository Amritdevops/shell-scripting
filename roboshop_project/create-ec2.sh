#!/bin/bash

INSTANCE_NAME=$1
if [ -z "${INSTANCE_NAME}" ]; then
  echo -e "\e[1;33mInstance name argument is needed\e[0m"
  exit
fi

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z "${AMI_ID}" ]; then
  echo -e"\e[1;31munable to find the Image AMI_ID\e[0m"
  exit
else
  echo "AMI_ID = ${AMI_ID}"
fi

aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro
