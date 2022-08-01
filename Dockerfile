FROM node
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
RUN npm test
EXPOSE 3001
CMD ["npm" ,"start"]

