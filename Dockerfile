FROM node
WORKDIR /app
ADD . /app
COPY package.json /app
RUN npm install
RUN npm test
EXPOSE 3000
CMD npm start
