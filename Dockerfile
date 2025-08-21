FROM ruby:3.3.9

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /preflight

WORKDIR /preflight

ADD .ruby-version /preflight/.ruby-version
ADD Gemfile /preflight/Gemfile
ADD Gemfile.lock /preflight/Gemfile.lock

RUN bundle install
ADD . /preflight