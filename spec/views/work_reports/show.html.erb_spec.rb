require 'spec_helper'

describe "work_reports/show.html.erb" do
  before(:each) do
    @work_report = assign(:work_report, stub_model(WorkReport,
      :report => "MyText",
      :user => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
