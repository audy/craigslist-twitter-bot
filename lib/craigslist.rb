require 'open-uri'
require 'bundler'
Bundler.require

# dont tweet if title includes these words
# (case insensitive, obviously)
FILTER = %w{iphone ipod ipad unlocked}.map!(&:downcase)

class CraigslistBot

  # create a new craigslistbot
  def initialize(args={})
    @url = args[:url]
    @delay = args[:delay] || 240 # seconds
    @max = args[:max] || 3 # max new things to tweet at once
  end

  # check craigslist, return array of new additions or nil
  def grab_post
    # parse document
    begin
      doc = Nokogiri::HTML(open(@url))
    rescue Exception => e
      $stderr.puts e
      # gotta catch 'em all
      # (sometimes Nokogiri throws up)
      return nil
    end

    # get first link
    result = doc.css('.pl').first.css('a').first

    # return if new, otherwise return nil
    if result.to_s == @last.to_s
      nil
    # make sure there are no bad words in there!
    # XXX this is very slow for big filter lists
    elsif result.to_s.split.map { |x| FILTER.include? x.downcase }.include? TRUE
      nil
    else
      @last = result
    end

  end

  # periodically check Craigslist for new posts
  # if there are any, tweet them
  def monitor!
    @last = grab_post
    loop do
      update = grab_post
      if update
        msg = "#{update.content} - http://gainesville.craigslist.org#{update[:href]}"
        tweet msg
        $stderr.puts msg
      end
      sleep @delay
    end
  end

end
