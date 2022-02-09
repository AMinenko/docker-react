FROM node:14-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .


FROM nginx
WORKDIR '/app'
COPY --from=builder /app/build /usr/share/nginx/html

