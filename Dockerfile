# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Install adb and fastboot
RUN apt-get update && apt-get install -y android-tools-adb android-tools-fastboot usbutils

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

RUN npm run dist:prod

# Expose a port (if needed)
EXPOSE 8000 8886

# Define the command to run the application
CMD [ "npm", "run", "script:dist:start" ]
