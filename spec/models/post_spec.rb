require 'pry'
require 'spec_helper'

describe 'options_from_collection_for_select' do
  before do
    @user = User.create(:username => "msimpson", :email => "msimpson@spfld.com", :password => "bestmom")
    @post = Post.create(:category => "grocery", :description => "sugar", :rtype => "request")
    @post.user = @user
    @post.save
  end
  
  it 'belongs to a user' do
    expect(@post.user.username).to eq("msimpson")
  end

end