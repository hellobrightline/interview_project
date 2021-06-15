FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /app

ENV RAILS_ENV development

ADD . /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

RUN gem install bundler:2.2.2
RUN bundle config set deployment = true
RUN bundle install

ENV PATH="/app/bin:${PATH}"
EXPOSE 3000
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
