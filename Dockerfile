FROM ruby:2.4.2

LABEL maintainer="Renan Oliveira ren4n.oliveir4@gmail.com"

ENV APP_HOME /usr/src/wit-cart
ENV GEM_HOME /usr/src/bundle
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_GEMFILE $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
ENV BUNDLE_JOBS=2

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

RUN apt-get install libxml2 libxml2-dev libxslt-dev -y && gem install bundler --no-ri --no-rdoc

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

RUN  bundle config --global path "$GEM_HOME" && bundle config --global bin "$GEM_HOME/bin"

EXPOSE 3000
