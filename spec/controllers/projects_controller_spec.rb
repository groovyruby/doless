require 'spec_helper'

describe ProjectsController do
  include Devise::TestHelpers
  render_views
  fixtures :users
  
  before(:each) do
    @user = users(:tas)
    sign_in @user
  end
  
end
