FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN --mount=type=cache,target=/app/.next/cache npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
