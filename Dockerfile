FROM public.ecr.aws/lambda/nodejs:12
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
EXPOSE 3001
CMD ["npm" ,"start"]
CMD [ "app.lambdaHandler" ]
