#STAGE 1
FROM node:latest as node
LABEL name="node-chrome"

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable

ENV CHROME_BIN /usr/bin/google-chrome

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version
WORKDIR /app
COPY . .
RUN npm install
RUN npm test
RUN npm run build --prod

#STAGE 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
