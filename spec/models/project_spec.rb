require 'spec_helper'

describe Project do
  fixtures :users
  should_validate_presence_of :name
  
  before(:each) do
    @valid_params = {:name=>"test groovy project"}
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
