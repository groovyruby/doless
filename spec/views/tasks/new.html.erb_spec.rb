require 'spec_helper'

describe "tasks/new.html.erb" do
  before(:each) do
    assign(:task, stub_model(Task,
      :title => "MyString",
      :project => nil,
      :user => nil,
      :is_starred => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "input#task_project", :name => "task[project]"
      assert_select "input#task_user", :name => "task[user]"
      assert_select "input#task_is_starred", :name => "task[is_starred]"
    end
  end
end
