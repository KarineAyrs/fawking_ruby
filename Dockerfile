FROM ruby:2.7.7
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="Europe/Moscow" apt-get install -y tzdata
RUN apt-get update \
	&& apt-get install -y --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y sqlite3

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]