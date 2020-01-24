#STAGE 1
FROM node:latest as node
RUN git clone git@github.com:RehanLaundrapp/angular-docker-test.git /app
RUN git checkout origin/second_docker_file
WORKDIR /app
RUN npm install
RUN npm run build --prod

#STAGE 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
