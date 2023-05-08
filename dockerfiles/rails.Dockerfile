FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /app

COPY Gemfile* /app/
RUN gem install bundler:2.3.26
RUN bundle config set force_ruby_platform true # Fix issue of GLIBC_2.29 not found
RUN #bundle config build.libv8 --with-system-v8
RUN bundle install
#--jobs 20 --retry 5 --without development test
COPY . .
#RUN bundle exec rake assets:precompile
#EXPOSE 3000
##
#CMD ["rails", "server", "-b", "0.0.0.0"]
