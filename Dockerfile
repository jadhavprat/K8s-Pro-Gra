# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the static HTML file to the Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to make the web app accessible
EXPOSE 80

# Command to run Nginx in the foreground (default for Nginx)
CMD ["nginx", "-g", "daemon off;"]

