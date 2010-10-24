require 'spec_helper'

describe User do
  before(:each) do
    @valid_params = {:first_name=>"john", :last_name=>"bar", :email=>"test_email@dolessapp.com", :password=>"qwe123", :password_confirmation=>"qwe123"}
  end
  it "should create user with valid params" do
    u = User.new(@valid_params)
    u.should be_valid
  end
  
  it "should require both first and last name" do
    @valid_params.merge!({:first_name=>""})
    u = User.new(@valid_params)
    u.should_not be_valid
    @valid_params.merge!({:last_name=>"", :first_name=>"john"})
    u = User.new(@valid_params)
    u.should_not be_valid
    @valid_params.merge!({:first_name=>""})
    u = User.new(@valid_params)
    u.should_not be_valid
  end
end
