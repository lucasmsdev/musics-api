FROM ruby:3.1.0-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /project
COPY Gemfile Gemfile.lock /project
RUN bundle install

COPY ./files2docker/entrypoint.sh /.
ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]