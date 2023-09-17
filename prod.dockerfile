# Use a lighter version of Node as a parent image
FROM node:18

# Set the working directory to /api
WORKDIR /client

# copy package.json into the container at /api
COPY package*.json /client/

# install dependencies
RUN npm install

# Copy the current directory contents into the container at /api
COPY . /client/

# Set environment to production
ENV NODE_ENV=production

# Build the project
RUN npm run build

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Set entrypoint
CMD [ "/bin/sh", "-c \"while sleep 1000; do :; done\"" ]