require 'spec_helper'

describe "tasks/show.html.erb" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "Title",
      :project => nil,
      :user => nil,
      :is_starred => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
