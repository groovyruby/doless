require 'spec_helper'

describe TasksController do
  include Devise::TestHelpers
  render_views
  
  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end
  
  it "should show all tasks" do
    get 'index'
    response.should be_successful
  end
  
  it "should mark task completed" do
    task = Factory(:task, :user=>@user)
    is_completed = task.is_completed
    get 'switch_completed', :id=>task.to_param
    assigns(:task).is_completed.should == !is_completed
    get 'switch_completed', :id=>task.to_param
    assigns(:task).is_completed.should == is_completed
  end

end
