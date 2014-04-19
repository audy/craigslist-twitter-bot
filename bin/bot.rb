#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'craigslistbot.rb'))


URL = 'http://gainesville.craigslist.org/zip/'

puts 'bot running, type CTRL-C to stop'
puts "watching #{URL}"

craigslist_bot = CraigslistBot.new :city => 'gainesville', :category => 'free'
craigslist_bot.monitor!
