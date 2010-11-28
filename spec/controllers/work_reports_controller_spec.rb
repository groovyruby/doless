require 'spec_helper'

describe WorkReportsController do

  def mock_work_report(stubs={})
    (@mock_work_report ||= mock_model(WorkReport).as_null_object).tap do |work_report|
      work_report.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all work_reports as @work_reports" do
      WorkReport.stub(:all) { [mock_work_report] }
      get :index
      assigns(:work_reports).should eq([mock_work_report])
    end
  end

  describe "GET show" do
    it "assigns the requested work_report as @work_report" do
      WorkReport.stub(:find).with("37") { mock_work_report }
      get :show, :id => "37"
      assigns(:work_report).should be(mock_work_report)
    end
  end

  describe "GET new" do
    it "assigns a new work_report as @work_report" do
      WorkReport.stub(:new) { mock_work_report }
      get :new
      assigns(:work_report).should be(mock_work_report)
    end
  end

  describe "GET edit" do
    it "assigns the requested work_report as @work_report" do
      WorkReport.stub(:find).with("37") { mock_work_report }
      get :edit, :id => "37"
      assigns(:work_report).should be(mock_work_report)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created work_report as @work_report" do
        WorkReport.stub(:new).with({'these' => 'params'}) { mock_work_report(:save => true) }
        post :create, :work_report => {'these' => 'params'}
        assigns(:work_report).should be(mock_work_report)
      end

      it "redirects to the created work_report" do
        WorkReport.stub(:new) { mock_work_report(:save => true) }
        post :create, :work_report => {}
        response.should redirect_to(work_report_url(mock_work_report))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved work_report as @work_report" do
        WorkReport.stub(:new).with({'these' => 'params'}) { mock_work_report(:save => false) }
        post :create, :work_report => {'these' => 'params'}
        assigns(:work_report).should be(mock_work_report)
      end

      it "re-renders the 'new' template" do
        WorkReport.stub(:new) { mock_work_report(:save => false) }
        post :create, :work_report => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested work_report" do
        WorkReport.should_receive(:find).with("37") { mock_work_report }
        mock_work_report.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :work_report => {'these' => 'params'}
      end

      it "assigns the requested work_report as @work_report" do
        WorkReport.stub(:find) { mock_work_report(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:work_report).should be(mock_work_report)
      end

      it "redirects to the work_report" do
        WorkReport.stub(:find) { mock_work_report(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(work_report_url(mock_work_report))
      end
    end

    describe "with invalid params" do
      it "assigns the work_report as @work_report" do
        WorkReport.stub(:find) { mock_work_report(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:work_report).should be(mock_work_report)
      end

      it "re-renders the 'edit' template" do
        WorkReport.stub(:find) { mock_work_report(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested work_report" do
      WorkReport.should_receive(:find).with("37") { mock_work_report }
      mock_work_report.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the work_reports list" do
      WorkReport.stub(:find) { mock_work_report }
      delete :destroy, :id => "1"
      response.should redirect_to(work_reports_url)
    end
  end

end
