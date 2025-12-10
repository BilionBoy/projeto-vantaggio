# syntax=docker/dockerfile:1

FROM ruby:3.3.5-slim

# Dependências essenciais mínimas
RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      nodejs npm \
      postgresql-client libpq-dev \
      libvips42 && \
    npm install -g yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

# Instalar dependências JS (sem travar lockfile é mais seguro)
RUN yarn install || true

EXPOSE 3200

CMD ["sh", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3200"]
