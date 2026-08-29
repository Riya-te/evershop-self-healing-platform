FROM node:20

WORKDIR /app

COPY . .

RUN npm ci
RUN npm run compile:db
RUN npm run compile
RUN npm run build

# Copy media into the image
COPY media ./media

EXPOSE 3000

CMD ["npm","run","start"]