require 'spec_helper'

describe CraigslistBot do
  let(:bot) { CraigslistBot.new :url => 'http://gainesville.craigslist.org/zip/' }
  let(:post) { bot.grab_post }

  it 'should grab the latest post from craigslist with a URL' do
    post[:href].should_not be_nil
  end

  it 'should grab the latest post from craigslist with content' do
    post.content.should_not be_nil
    post.content.should_not == ''
  end

end
