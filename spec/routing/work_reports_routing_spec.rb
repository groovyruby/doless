require "spec_helper"

describe WorkReportsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sample_project/work_reports" }.should route_to(:controller => "work_reports", :action => "index", :project_id=>"sample_project")
    end

    it "recognizes and generates #new" do
      { :get => "/sample_project/work_reports/new" }.should route_to(:controller => "work_reports", :action => "new", :project_id=>"sample_project")
    end

    it "recognizes and generates #show" do
      { :get => "/sample_project/work_reports/1" }.should route_to(:controller => "work_reports", :action => "show", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #edit" do
      { :get => "/sample_project/work_reports/1/edit" }.should route_to(:controller => "work_reports", :action => "edit", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #create" do
      { :post => "/sample_project/work_reports" }.should route_to(:controller => "work_reports", :action => "create", :project_id=>"sample_project")
    end

    it "recognizes and generates #update" do
      { :put => "/sample_project/work_reports/1" }.should route_to(:controller => "work_reports", :action => "update", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sample_project/work_reports/1" }.should route_to(:controller => "work_reports", :action => "destroy", :id => "1", :project_id=>"sample_project")
    end

  end
end
