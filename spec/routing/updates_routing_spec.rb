require "spec_helper"

describe UpdatesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/updates" }.should route_to(:controller => "updates", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/updates/new" }.should route_to(:controller => "updates", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/updates/1" }.should route_to(:controller => "updates", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/updates/1/edit" }.should route_to(:controller => "updates", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/updates" }.should route_to(:controller => "updates", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/updates/1" }.should route_to(:controller => "updates", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/updates/1" }.should route_to(:controller => "updates", :action => "destroy", :id => "1")
    end

  end
end
