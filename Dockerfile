FROM tomcat:9.0.31-jdk8-adoptopenjdk-openj9
LABEL MAINTAINER = nidish98
ADD swe-hw2.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
