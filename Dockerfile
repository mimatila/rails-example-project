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
#RUN apt install ruby-railties -y
RUN rm ./config/credentials.yml.enc
RUN EDITOR=nano rails credentials:edit
RUN bin/rails db:migrate
RUN rake assets:precompile
#CMD rails s -p $PORT
#CMD rails s -e production --port $PORT
CMD ["rails", "s", "-e", "production"]
