FROM ruby:2.7.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /icebreak

ADD Gemfile /icebreak/Gemfile
ADD Gemfile.lock /icebreak/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /icebreak