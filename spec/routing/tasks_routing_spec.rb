require "spec_helper"

describe TasksController do
  describe "routing" do
    
    context "with project selected" do
      it "recognizes and generates #index" do
        { :get => "/sample_project/tasks" }.should route_to(:controller => "tasks", :action => "index", :project_id=>"sample_project")
      end

      it "recognizes and generates #new" do
        { :get => "/sample_project/tasks/new" }.should route_to(:controller => "tasks", :action => "new", :project_id=>"sample_project")
      end

      it "recognizes and generates #show" do
        { :get => "/sample_project/tasks/1" }.should route_to(:controller => "tasks", :action => "show", :id => "1", :project_id=>"sample_project")
      end

      it "recognizes and generates #edit" do
        { :get => "/sample_project/tasks/1/edit" }.should route_to(:controller => "tasks", :action => "edit", :id => "1", :project_id=>"sample_project")
      end

      it "recognizes and generates #create" do
        { :post => "/sample_project/tasks" }.should route_to(:controller => "tasks", :action => "create", :project_id=>"sample_project")
      end

      it "recognizes and generates #update" do
        { :put => "/sample_project/tasks/1" }.should route_to(:controller => "tasks", :action => "update", :id => "1", :project_id=>"sample_project")
      end

      it "recognizes and generates #destroy" do
        { :delete => "/sample_project/tasks/1" }.should route_to(:controller => "tasks", :action => "destroy", :id => "1", :project_id=>"sample_project")
      end
    end
    
    context "without project selected" do
      it "recognizes and generates #index" do
        { :get => "/tasks" }.should route_to(:controller => "tasks", :action => "index")
      end

      it "recognizes and generates #new" do
        { :get => "/tasks/new" }.should route_to(:controller => "tasks", :action => "new")
      end

      it "recognizes and generates #show" do
        { :get => "/tasks/1" }.should route_to(:controller => "tasks", :action => "show", :id => "1")
      end

      it "recognizes and generates #edit" do
        { :get => "/tasks/1/edit" }.should route_to(:controller => "tasks", :action => "edit", :id => "1")
      end

      it "recognizes and generates #create" do
        { :post => "/tasks" }.should route_to(:controller => "tasks", :action => "create")
      end

      it "recognizes and generates #update" do
        { :put => "/tasks/1" }.should route_to(:controller => "tasks", :action => "update", :id => "1")
      end

      it "recognizes and generates #destroy" do
        { :delete => "/tasks/1" }.should route_to(:controller => "tasks", :action => "destroy", :id => "1")
      end
    end
  end
end
