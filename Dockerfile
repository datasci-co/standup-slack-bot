FROM node:8.5

RUN mkdir /app
WORKDIR /app

ADD ./package.json .
ADD ./package-lock.json .

RUN npm install

CMD npm run start

# pass these args via docker build arguments `--build-arg GIT_COMMIT=foo`
# these must stay at the very end, so we don't rebuild every layer every time
ARG GIT_COMMIT=unkown
ARG DATE=unkown
LABEL maintainer="sre-team@quantopian.com" \
    git-commit=$GIT_COMMIT \
    build-date=$DATE
