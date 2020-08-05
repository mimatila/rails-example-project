FROM ruby:2.6
WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install
WORKDIR /usr/src/myapp
EXPOSE 3000
COPY . /usr/src/myapp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN bin/rails db:migrate
CMD ["rails", "s", "-e", "production"]
