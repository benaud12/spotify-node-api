# Create image based on the official Node 6 image from dockerhub
FROM armhf/node:7.1.0

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/spotify-api

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/spotify-api

# Copy dependency definitions
COPY package.json /usr/src/spotify-api

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY . /usr/src/spotify-api

# Expose the port the app runs in
EXPOSE 3000

# Start express server
CMD ["node", "server.js"]