FROM tomcat:9.0
RUN apt-get update &&  apt-get install default-jdk -y &&  apt-get install maven -y
WORKDIR /var/hw/
# Добавляем папку с исходниками с хост машины, используя инструкцию ADD 
# можно было  RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git, установив git
ADD boxfuse-sample-java-war-hello  /var/hw
RUN cd /var/hw/
RUN  mvn package
RUN cp /var/hw/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
