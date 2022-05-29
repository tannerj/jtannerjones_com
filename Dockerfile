# syntax=docker/dockerfile:1
FROM ruby:3.1.2-bullseye

RUN apt-get update -yqq && apt-get install -yqq \
  build-essential \
  zlib1g-dev

WORKDIR /usr/src/app

COPY Gemfile* .
RUN bundle install

COPY . .

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0","--livereload"]

EXPOSE 4000
