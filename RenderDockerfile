# Use official Tomcat image
FROM tomcat:9.0-jdk11

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to Tomcat as ROOT.war
COPY target/LovelyGlazeBeautyStudio.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
