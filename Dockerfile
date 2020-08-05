FROM ruby:2.6
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN bundle install
RUN apt install -y nodejs
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
RUN bin/rails db:migrate RAILS_ENV=production
#RUN rake assets:precompile
#CMD rails s -p $PORT
#CMD rails s -e production --port $PORT
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
