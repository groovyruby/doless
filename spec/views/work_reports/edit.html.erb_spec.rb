require 'spec_helper'

describe "work_reports/edit.html.erb" do
  before(:each) do
    @work_report = assign(:work_report, stub_model(WorkReport,
      :new_record? => false,
      :report => "MyText",
      :user => nil,
      :project => nil
    ))
  end

  it "renders the edit work_report form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => work_report_path(@work_report), :method => "post" do
      assert_select "textarea#work_report_report", :name => "work_report[report]"
      assert_select "input#work_report_user", :name => "work_report[user]"
      assert_select "input#work_report_project", :name => "work_report[project]"
    end
  end
end
