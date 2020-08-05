FROM ruby:2.6
WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install
WORKDIR /usr/src/myapp
EXPOSE 3000
COPY . /usr/src/myapp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN rm ./config/credentials.yml.enc
RUN EDITOR=nano rails credentials:edit
RUN rails db:migrate RAILS_ENV=production
RUN rake assets:precompile
CMD ["rails", "s", "-e", "production"]
