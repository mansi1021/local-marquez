# Use the base image from Marquez
FROM marquezproject/marquez:latest

# Set the working directory
WORKDIR /app

# Copy the wait-for-it script into the container
COPY wait-for-it.sh /app/wait-for-it.sh

# Make the wait-for-it script executable
RUN chmod +x /app/wait-for-it.sh

# Set the entrypoint to wait for PostgreSQL before starting the API
ENTRYPOINT ["/app/wait-for-it.sh", "marquez-postgres:5432", "--", "java", "-jar", "marquez-api.jar"]
