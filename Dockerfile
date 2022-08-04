FROM node
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
EXPOSE 3001
CMD ["npm" ,"start"]
