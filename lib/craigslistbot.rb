require 'bundler'
Bundler.require

# dont tweet if title includes these words
# (case insensitive, obviously)
FILTER = %w{iphone ipod ipad unlocked}.map!(&:downcase)

class CraigslistBot

  # create a new craigslistbot
  def initialize(args={})
    @city = args[:city]
    @category = args[:category]
    @delay = args[:delay] || 240 # seconds
    @max = args[:max] || 3 # max new things to tweet at once
    @cl = Craigslist.city :gainesville
    # make sure twitter works
    $stderr.puts "I have #{followers.size} followers (and Twitter API is working)"
    @first_run = true
  end

  # check craigslist, return array of new additions or nil
  def posts
    $stderr.puts 'checking...'
    @cl.category(@category).limit(@max).fetch
  end

  def latest
    posts.last
  end

  # check if there are any new posts.
  # if so, return it. Otherwise, return nil.
  # XXX this will break if someone deletes a post.
  # need to implement some kind of post storage
  def new_post
    latest_post = latest
    if @last == latest_post || @first_run
      @first_run = false
      return false
    else
      $stderr.puts "NEW POST!"
      $stderr.puts @last.inspect
      @last = latest_post
      return latest_post
    end
  end

  # periodically check Craigslist for new posts
  # if there are any, tweet them
  def monitor!
    loop do
      post = new_post
      if post
        msg = "#{post['text']} - http://#{@city}.craigslist.org#{post['href']}"
        tweet msg
        $stderr.puts msg
      end
      sleep @delay
    end
  end

end
