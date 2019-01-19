FROM ruby:2.5-alpine
MAINTAINER "raphael.valyi@akretion.com"

WORKDIR /usr/src/app
COPY . .
RUN addgroup -S app && adduser -S -G app app
RUN mkdir -p tmp log && chown app:app tmp log

RUN apk add build-base ghostscript git tzdata

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN bundle install
RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN apk del build-base git tzdata

EXPOSE 9292
USER app
CMD bundle exec puma config.ru
