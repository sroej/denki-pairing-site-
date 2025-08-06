FROM node:lts-bullseye

RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/app


COPY package.json .


RUN npm install --legacy-peer-deps


RUN npm install -g qrcode-terminal pm2


COPY . .

EXPOSE 5000

CMD ["npm", "start"]