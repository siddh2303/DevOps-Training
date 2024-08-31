# # Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jdk-slim

# # Set the working directory in the container
WORKDIR /app

# # Copy the current directory contents into the container at /app
COPY . /app

# # Compile the Java program
RUN javac Main.java

# # Run the Java program
CMD ["java", "Main"]
# Use the official Nginx base image
#FROM nginx:latest

# Copy the custom HTML file to the appropriate location
#COPY index.html /usr/share/nginx/html/

# Expose port 90
#EXPOSE 90
