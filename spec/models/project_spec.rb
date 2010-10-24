require 'spec_helper'

describe Project do
  fixtures :users
  
  before(:each) do
    @valid_params = {:name=>"test groovy project"}
  end
  
  it "should be valid when valid params are given" do
    p = Project.new(@valid_params)
    p.should be_valid
  end
  
  it "should not be valid when invalid parameters are used" do
    p = Project.new
    p.should_not be_valid
  end
  
  context "permissions" do 
    it "should create new permission" do
      p = Project.new(@valid_params)
      p.save!
      p.make_admin(users(:tas))
      p.reload
      p.permissions.count.should == 1
      p.permissions.first.permission_type.should == Permission::PERMISSION_TYPES[:admin]
    end
    
  end
end
