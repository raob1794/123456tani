FROM node
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
RUN npm test
EXPOSE 3000
CMD ["node","server.js"] 

