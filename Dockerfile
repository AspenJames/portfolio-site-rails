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

# '-b' is necessary to bind the server to 0.0.0.0,
# since the port is mapped externally to 'localhost',
# yet mapped internally to '0.0.0.0'.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
