pipeline {

    agent any
    tools {
        maven 'Maven3.5.4'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Delivery') {
            steps {
                sh 'aws s3 cp target/SpringBootExample-0.0.1-SNAPSHOT.jar s3://training.conygre.com/builds/sampleapp.jar --region eu-west-1'
            }
        }
        stage('Deploy') {
            steps {
                sh '''aws cloudformation create-stack --template-body  file://scripts/sampleapp.template --stack-name SampleApp --capabilities CAPABILITY_IAM --region eu-west-1
                aws cloudformation wait stack-create-complete --stack-name SampleApp --region eu-west-1 
                aws cloudformation describe-stack-events --stack-name SampleApp --region eu-west-1'''
            }
        }
    }
}