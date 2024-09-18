# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Medusa CLI globally
RUN npm install -g @medusajs/medusa-cli

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build:server

# Expose the port Medusa will run on
EXPOSE 9000

# Command to run the application
CMD [ "medusa", "develop" ]
