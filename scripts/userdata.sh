#!/bin/bash
yum update -y,
yum -y install java-1.8.0
yum -y remove java-1.7.0-openjdk
cd /home/ec2-user
aws s3 cp s3://training.conygre.com/builds/sampleapp.jar /home/ec2-user/sampleapp.jar
nohup java -jar sampleapp.jar > ec2dep.log