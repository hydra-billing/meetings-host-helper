FROM ruby:4.0.6-slim-bookworm AS base

WORKDIR /app
ENV BUNDLE_FROZEN=true

FROM base AS build

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

FROM base

RUN useradd --create-home --uid 1000 app

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY Gemfile Gemfile.lock *.rb ./
COPY gateways/ ./gateways/

USER app
CMD ["bundle", "exec", "ruby", "create_battle.rb"]
