#!/bin/bash

INSTANCE_NAME=$1
if [ -z "${INSTANCE_NAME}" ]; then
  echo -e "\e[1;33mInstance name argument is needed\e[0m"
  exit
fi

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z "${AMI_ID}" ]; then
  echo -e"\e[1;31mUnable to find the Image AMI_ID\e[0m"
  exit
else
  echo "AMI_ID = ${AMI_ID}"
fi

PRIVATE_IP=$()aws ec2 describe-instances --filters Name=tag:Name,Values=${INSTANCE_NAME} query 'Reservations[*].PrivateIpAddress' --output text)
if [ -z "${PRIVATE_IP}" ]; then
  aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${INSTANCE_NAME}}]"
else
  echo "Instance ${INSTANCE_NAME} is already exists. hence not creating"
  exit
fi
