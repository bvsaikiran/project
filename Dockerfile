FROM tomcat:8.0-alpine

COPY /home/ec2-user/WebAppCal-1.2.3.war /usr/local/tomcat/webapps
