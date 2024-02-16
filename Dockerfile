# base image for the project
FROM node:14

# set working directory
WORKDIR /app

# copy the source code to /app
COPY . /app

# set environment variables
ENV NODE_ENV=production 
ENV DB_HOST=item-db

# install packages
RUN npm install --production --unsafe-perm && npm run build

# expose port 8080
EXPOSE 8080

# run the project
CMD ["npm", "start"]