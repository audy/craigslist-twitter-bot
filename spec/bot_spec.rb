require 'spec_helper'

describe CraigslistBot do
  let(:bot) { CraigslistBot.new :category => 'free' , :city => 'gainesville' }
  let(:post) { bot.latest }

  it 'should get the latest post title' do
    post['text'].should_not be_nil
    post['text'].should_not == ''
  end

end
