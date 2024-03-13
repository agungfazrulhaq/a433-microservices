# Use the official Node.js 14 image as base
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN apk add --no-cache bash

RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

RUN chmod +x /bin/wait-for-it.sh

# Expose the port your app runs on
EXPOSE 3001

# Command to run the application
CMD ["node", "index.js"]
