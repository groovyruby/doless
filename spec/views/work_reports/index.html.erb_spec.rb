require 'spec_helper'

describe "work_reports/index.html.erb" do
  before(:each) do
    assign(:work_reports, [
      stub_model(WorkReport,
        :report => "MyText",
        :user => nil,
        :project => nil
      ),
      stub_model(WorkReport,
        :report => "MyText",
        :user => nil,
        :project => nil
      )
    ])
  end

  it "renders a list of work_reports" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
