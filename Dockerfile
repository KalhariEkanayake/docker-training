#Use an official Node.js runtime as a base image
FROM node:20-alpine as base

#Set the working directory to /app
WORKDIR /app

#Copy package.json and package-lock.json to the working directory
COPY package*.json ./

#Install any needed packages specified in package.json
RUN npm install

#Copy the local source files to the working directory
COPY . .

