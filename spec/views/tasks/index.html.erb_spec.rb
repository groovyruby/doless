require 'spec_helper'

describe "tasks/index.html.erb" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :title => "Title",
        :project => nil,
        :user => nil,
        :is_starred => false
      ),
      stub_model(Task,
        :title => "Title",
        :project => nil,
        :user => nil,
        :is_starred => false
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
