FROM ruby:2.6.6
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install
WORKDIR /usr/app
COPY . .
RUN rm ./config/credentials.yml.enc
RUN EDITOR=nano rails credentials:edit
RUN rails db:migrate RAILS_ENV=production
RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
