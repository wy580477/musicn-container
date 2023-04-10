FROM node:alpine

WORKDIR /data

RUN npm i musicn -g \
    && rm -rf ${HOME}/.npm