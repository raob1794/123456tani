FROM node
WORKDIR /app
ADD . /app
COPY ./json
RUN npm install
RUN npm test
EXPOSE 3000
CMD npm start
