FROM node:16-slim
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm cache clean
RUN npm install
COPY . .
EXPOSE 80
CMD [ "npm", "run", "dev" ]