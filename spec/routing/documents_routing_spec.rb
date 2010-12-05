require "spec_helper"

describe DocumentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sample_project/documents" }.should route_to(:controller => "documents", :action => "index", :project_id=>"sample_project")
    end

    it "recognizes and generates #new" do
      { :get => "/sample_project/documents/new" }.should route_to(:controller => "documents", :action => "new", :project_id=>"sample_project")
    end

    it "recognizes and generates #show" do
      { :get => "/sample_project/documents/1" }.should route_to(:controller => "documents", :action => "show", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #edit" do
      { :get => "/sample_project/documents/1/edit" }.should route_to(:controller => "documents", :action => "edit", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #create" do
      { :post => "/sample_project/documents" }.should route_to(:controller => "documents", :action => "create", :project_id=>"sample_project")
    end

    it "recognizes and generates #update" do
      { :put => "/sample_project/documents/1" }.should route_to(:controller => "documents", :action => "update", :id => "1", :project_id=>"sample_project")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sample_project/documents/1" }.should route_to(:controller => "documents", :action => "destroy", :id => "1", :project_id=>"sample_project")
    end

  end
end
