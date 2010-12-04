require 'spec_helper'

describe UpdatesController do
  include Devise::TestHelpers
  render_views
  
  before(:each) do
    @user = Factory(:user)
    @valid_update = Factory.attributes_for(:update)
    sign_in @user
  end
  
  it "should be able to post new update" do
    old_count = Update.all.count
    post 'create', :update=>@valid_update
    
    response.should redirect_to(updates_url)
    Update.all.count.should == old_count+1
  end

end
