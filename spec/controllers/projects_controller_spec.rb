require 'spec_helper'

describe ProjectsController do
  include Devise::TestHelpers
  render_views
  
  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end
  
  it "should show all projects" do
    get 'index'
    response.should be_successful
  end
  
end
