require 'spec_helper'

describe Document do
  should_validate_presence_of :title
  should_validate_presence_of :user_id
  should_validate_presence_of :changed_by_id
  
  before(:each) do
    @user = Factory(:user)
    @project = Factory(:project)
    @project.make_admin(@user)
  end
  
  it "should be marked as landing if this is first menu_item in site" do
    document = Factory.build(:document, :project_id=>@project)
    document.project = @project
    document.user = @user
    document.changer = @user
    document.save!
    document.reload
    document.is_main.should == true
  end

  it "should keep only one default site in system" do
    doc1 = Factory.build(:document, :project_id=>@project)
    doc1.project = @project
    doc1.user = @user
    doc1.changer = @user
    doc1.save!
    doc2 = Factory.build(:document, :project_id=>@project)
    doc2.project = @project
    doc2.user = @user
    doc2.changer = @user
    doc2.is_main = true
    doc2.save!
    doc1.reload
    doc1.is_main.should == false
  end
end
