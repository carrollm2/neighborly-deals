require 'pry'
require 'spec_helper'

describe 'Request' do
  before do
    @user = User.create(:username => "msimpson", :email => "msimpson@spfld.com", :password => "bestmom")
    @request = Request.create(:category => "grocery", :description => "sugar", :rtype => "request")
    @request.user = @user
    @request.save
  end
  
  it 'belongs to a user' do
    binding.pry
    expect(@request.user.username).to eq("msimpson")
  end

end