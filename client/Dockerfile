FROM node:21.7.1

WORKDIR /app

COPY package.json .

RUN yarn

COPY . .

RUN yarn build

CMD [ "yarn", "start" ]