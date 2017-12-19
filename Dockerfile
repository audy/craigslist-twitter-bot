FROM ruby:onbuild

WORKDIR /bot

ADD . /bot

ENTRYPOINT ["bin/bot.rb"]
