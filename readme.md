# craigslist-twitter-bot

A Twitter bot that scrapes a Craigslist page and tweets when new posts
are added.

Currently tweeting about
[free stuff in Gainesville, FL](http://twitter.com/gvillejunk)

By Austin G. Davis-Richardson

## How Do?

So you want to run your own Craigslist Twitter bot, eh?

You need Ruby 1.9 with Bundler.

```
git clone https://github.com/audy/craigslist
cd craigslist
bundle

# run the bot:
chatterbot_config=lib/config.yml bundle exec bin/bot.rb

# or docker (see run.sh)
```

### huh?

[Buy me a coffee](http://goo.gl/maps/akdnw) and I will teach you how.

## License

The MIT License (MIT)

Copyright (c) 2013-2014 Austin G. Davis-Richardson

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
