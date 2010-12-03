require 'spec_helper'

describe DashboardsController do
  include Devise::TestHelpers
  render_views
  
  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
