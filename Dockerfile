FROM node:10

# Create app directory
# Same cd form /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

# copy all package.json at host from WORKDIR
COPY package*.json ./ 

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
# Copy all file at host form WORKDIR
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]