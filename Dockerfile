FROM tomcat:latest
LABEL author=Pradymn
LABEL project_name=simple_maven_java_project.
WORKDIR /usr/local/tomcat/webapps
COPY webapp/target/webapp.war .
RUN chmod -R 777 /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
