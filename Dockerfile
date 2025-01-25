FROM tomcat:latest
LABEL author=Pradymn
LABEL project_name=simple_maven_java_project.
WORKDIR usr/local/tomcat/webapps
COPY webapp/target/webapp.war .
EXPOSE 8000
CMD ["catalina.sh","run"]
