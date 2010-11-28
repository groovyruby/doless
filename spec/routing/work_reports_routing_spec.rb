require "spec_helper"

describe WorkReportsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/work_reports" }.should route_to(:controller => "work_reports", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/work_reports/new" }.should route_to(:controller => "work_reports", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/work_reports/1" }.should route_to(:controller => "work_reports", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/work_reports/1/edit" }.should route_to(:controller => "work_reports", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/work_reports" }.should route_to(:controller => "work_reports", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/work_reports/1" }.should route_to(:controller => "work_reports", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/work_reports/1" }.should route_to(:controller => "work_reports", :action => "destroy", :id => "1")
    end

  end
end
