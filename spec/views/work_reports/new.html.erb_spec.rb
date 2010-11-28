require 'spec_helper'

describe "work_reports/new.html.erb" do
  before(:each) do
    assign(:work_report, stub_model(WorkReport,
      :report => "MyText",
      :user => nil,
      :project => nil
    ).as_new_record)
  end

  it "renders new work_report form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => work_reports_path, :method => "post" do
      assert_select "textarea#work_report_report", :name => "work_report[report]"
      assert_select "input#work_report_user", :name => "work_report[user]"
      assert_select "input#work_report_project", :name => "work_report[project]"
    end
  end
end
