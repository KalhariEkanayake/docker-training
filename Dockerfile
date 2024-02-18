# Use the derived image using the base image for development
FROM my-nest-app-base:latest as build

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Copy the local source files to the working directory
COPY . .

# Run the build command 
RUN npm run build

# Create the final production image
FROM my-nest-app-prod as prod

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Copy the built application from the 'build' image
COPY --from=build /usr/src/app/dist ./dist

# Set ownership to the 'node' user
RUN chown node:node -R /usr/src/app/dist

# Switch to the 'node' user
USER node

# Define the command to run the application
 CMD ["node", "dist/main"]