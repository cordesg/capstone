FROM tomcat:latest
LABEL maintainer="gregory.cordes@ngc.com"
#Configure for Tomcat 9.0 as new directory structure does not work from docker hub
RUN mv webapps webapps2
RUN mv webapps.dist/ webapps
#Enable manager gui access and remove localhost restriction
ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/
ADD tomcat-users.xml /usr/local/tomcat/conf/
#Add .war file     
ADD capstone.war /usr/local/tomcat/webapps/
#Expose the tomcat server port at 8080.
EXPOSE 8080
#Start tomcat
CMD ["catalina.sh", "run"]  
