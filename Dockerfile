# ------------------------------- Build Stage ----------------------------------
FROM node:14.21.3-alpine3.17 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# ----------------------------- Production Stage ---------------------------------
FROM node:14.21.3-alpine3.17 AS production
WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]

