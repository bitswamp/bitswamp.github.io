FROM ruby:2.6

RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN gem install bundler

COPY . /bitswamp.com

WORKDIR /bitswamp.com

RUN bundle install

CMD bundle exec jekyll serve --force_polling
