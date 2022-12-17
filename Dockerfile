
FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
WORKDIR /billinho_s_a
COPY Gemfile /billinho_s_a/Gemfile
COPY Gemfile.lock /billinho_s_a/Gemfile.lock
RUN bundle install
RUN bundle update --bundler
CMD 'rails server -b 0.0.0.0'