require 'pry'
describe 'User' do
  before do
    @user = User.create(:username => "test 123", :email => "test123@aol.com", :password => "test")
  end
  it 'can slug the username' do
    expect(@user.slug).to eq("test-123")
  end