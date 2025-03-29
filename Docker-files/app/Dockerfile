# Stage 1: Build the Application 
FROM maven:3.9.9-eclipse-temurin-21-jammy AS build_image
RUN git clone https://github.com/MrFostoq/containerized-apps.git
RUN cd containerized-apps && mvn install


# Stage 2: Deploy to Tomcat 
FROM tomcat:10-jdk21

# Copy the built WAR file from the builder stage to Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build_image /vprofile-project/target/*.war /usr/local/tomcat/webapps/app.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
