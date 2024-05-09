# ------------------------------- Build Stage ----------------------------------
FROM node:14.21.3-alpine3.17 AS build

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies and devDependencies
# --production doesnt install devDependecies which cause nodemon package issue for this repo
#RUN npm install --production
RUN npm install

# Copy all files to the working directory
COPY . .

# ----------------------------- Production Stage ---------------------------------
FROM node:14.21.3-alpine3.17 AS production

# Set working directory in the container
WORKDIR /app

# Copy source files and node_modules from build stage
COPY --from=build /app .

# Expose the port on which the app will run
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]

