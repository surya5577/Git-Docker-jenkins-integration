FROM centos
RUN yum install java -y
RUN yum install git -y
RUN yum install maven -y && yum install wget -y
WORKDIR /opt
RUN git clone https://github.com/surya5577/hello-world.git
RUN cd hello-world/webapp
WORKDIR /opt/hello-world/webapp
RUN mvn install
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz
RUN tar -xvzf apache-tomcat-8.5.3.tar.gz
#RUN mv tomcat-8/v8.5.3/* /opt/tomcat/.
CMD ["/opt/apache-tomcat-8.5.3/bin/catalina.sh","run"]
RUN cp -r  /opt/hello-world/webapp/target /opt/apache-tomcat-8.5.3/webapps

