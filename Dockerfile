FROM node
WORKDIR /app
ADD . /app
copy ./json
RUN npm install
RUN npm test
EXPOSE 3000
CMD npm start
