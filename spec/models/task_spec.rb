require 'spec_helper'

describe Task do
  should_validate_presence_of :title
  
  before(:each) do
    @user = Factory(:user)
  end
  
  it "should switch it's state" do
    task = Factory(:task, :user=>@user)
    is_completed = task.is_completed
    task.switch_completed!
    task.reload
    task.is_completed.should == !is_completed
    task.switch_completed!
    task.is_completed.should == is_completed
    
  end
  
  it "should switch being starred" do
    task = Factory(:task, :user=>@user)
    is_starred = task.is_starred
    task.switch_starred!
    task.reload
    task.is_starred.should == !is_starred
    task.switch_starred!
    task.is_starred.should == is_starred
    
  end
end
