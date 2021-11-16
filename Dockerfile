FROM node:14.17-alpine as builder

WORKDIR /app
COPY ./ ./
RUN npm install
RUN npm run build --prod --output-path=./dist

FROM nginx:1.21.0

WORKDIR /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist /usr/share/nginx/html/dist
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && apt-get -y install mc

CMD ["nginx", "-g", "daemon off;"]
