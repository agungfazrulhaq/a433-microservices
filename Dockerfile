# Use the official Node.js 18 image as base
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

RUN apk add --no-cache bash

RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

RUN chmod +x /bin/wait-for-it.sh

# Command to run the application
CMD ["node", "index.js"]