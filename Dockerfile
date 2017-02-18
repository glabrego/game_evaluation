FROM ruby:2.4
MAINTAINER 'glabrego@gmail.com'

RUN mkdir -p /usr/src/game_evaluation
WORKDIR  /usr/src/game_evaluation

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN apt-get update && apt-get install -y nodejs postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY Gemfile /usr/src/game_evaluation/

# Uncomment the line below if Gemfile.lock is maintained outside of build process
COPY Gemfile.lock /usr/src/game_evaluation/

RUN bundle install

COPY . /usr/src/game_evaluation
