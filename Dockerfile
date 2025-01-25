FROM tomcat:latest
LABEL author:Pradyumn
LABEL project_name: simple_maven_java_project.
WORKDIR usr/local/tomcat/webapps
EXPOSE 8000
COPY webapp/target/webapp

