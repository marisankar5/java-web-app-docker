FROM tomcat:latest
MAINTAINER iyappankmech@gmail.com
# Dummy text to test 
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
EXPOSE 8080
