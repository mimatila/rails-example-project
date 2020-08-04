FROM ruby:2.6
WORKDIR /usr/src/myapp
EXPOSE 3000
COPY . /usr/src/myapp
RUN bundle config --global frozen 1
COPY Gemfile Gemfile.lock ./
ENV LANG C.UTF-8
#RUN gem install bundler
RUN gem update bundler
RUN bundle install
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN npm install
RUN bin/rails db:migrate
ENTRYPOINT rails s --port $PORT
