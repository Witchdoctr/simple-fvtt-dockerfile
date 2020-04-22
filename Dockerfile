FROM node:14-alpine

ENV UID=99
ENV GUID=100

RUN deluser node
RUN adduser -u $UID -g $GUID -D foundry

USER foundry

RUN mkdir -p /home/foundry/data
RUN mkdir -p /home/foundry/app

WORKDIR /home/foundry/app
COPY . .

EXPOSE 30000
CMD ["node", "/home/foundry/app/resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]
