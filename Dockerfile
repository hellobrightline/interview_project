FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /app

ENV RAILS_ENV production

ADD . /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle config set deployment = true
RUN bundle install

ENV PATH="/app/bin:${PATH}"
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
