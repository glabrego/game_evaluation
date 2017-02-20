FROM ruby:2.4
MAINTAINER 'glabrego@gmail.com'

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /game_evaluation
WORKDIR /game_evaluation

COPY ./Gemf* /game_evaluation/

RUN bundle install

ADD . /game_evalution
