# Use official Ruby base image, v2.6
FROM ruby:2.6-alpine

RUN apk update
RUN apk add --update build-base
RUN apk add --update nodejs
RUN apk add --update yarn
RUN gem install bundler

WORKDIR /usr/app
COPY ./ ./

RUN bundle install
RUN yarn install

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
