#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'craigslist.rb'))

puts 'bot running, type CTRL-C to stop'
gainesville = CraigslistBot.new :url => 'http://gainesville.craigslist.org/zip/'
gainesville.monitor!
