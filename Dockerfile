FROM tomcat:latest
COPY */target/webapp.war /usr/local/tomcat/webapps/webapp.war
#RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
