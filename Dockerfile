FROM ruby:2.6
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN bundle install
RUN apt install -y nodejs
RUN bin/rails db:migrate RAILS_ENV=production
#RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
