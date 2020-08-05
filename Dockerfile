FROM ruby:2.6
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN bundle install
RUN bin/rails db:migrate
#RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
