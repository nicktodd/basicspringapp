# Basic Spring Boot Application

# How to Deploy to AWS as a Spring Boot Application on EC2.

## Deploy to an EC2 Instance
Initially, to deploy to an EC2 instance, 
you can create an EC2 using the userdata specified in the scripts folder.

A prebuilt version of the Jar file is located in S3 in a public location and the userdata is downloading that.

Initially, make sure you open port 8080 to anywhere in order to see if the API works.

Once you have the application deployed on  an EC2 and working, then you could add in a load balancer.

## Create a Load Balancer for your application

There are some excellent instructions here as to how this can be achieved.

https://enlear.academy/how-to-use-aws-load-balancer-to-deploy-spring-boot-applications-c41877fc8682

Note that your healthcheck can simply be to the test path, ie /test (see the HelloWorldController)

## Create an Autoscaled and load balanced cluster for your applicaton

Finally, if your load balanced set of servers is working, you can try to set up autoscaling as well.

You can visit here to set it up:

https://docs.aws.amazon.com/autoscaling/ec2/userguide/tutorial-ec2-auto-scaling-load-balancer.html

To test it, you can deliberately fail one of your instances by visiting the breakit controller at the /kill url. This terminates the Spring Boot application.
You should then see a new server appear to replace the failed instance.

To trigger a server CPU increase, you can visit /cpu which will cause the server you visit to max out on CPU, and this should trigger an autoscale.




