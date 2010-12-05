require 'spec_helper'

describe DocumentsController do

  def mock_document(stubs={})
    (@mock_document ||= mock_model(Document).as_null_object).tap do |document|
      document.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all documents as @documents" do
      Document.stub(:all) { [mock_document] }
      get :index
      assigns(:documents).should eq([mock_document])
    end
  end

  describe "GET show" do
    it "assigns the requested document as @document" do
      Document.stub(:find).with("37") { mock_document }
      get :show, :id => "37"
      assigns(:document).should be(mock_document)
    end
  end

  describe "GET new" do
    it "assigns a new document as @document" do
      Document.stub(:new) { mock_document }
      get :new
      assigns(:document).should be(mock_document)
    end
  end

  describe "GET edit" do
    it "assigns the requested document as @document" do
      Document.stub(:find).with("37") { mock_document }
      get :edit, :id => "37"
      assigns(:document).should be(mock_document)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created document as @document" do
        Document.stub(:new).with({'these' => 'params'}) { mock_document(:save => true) }
        post :create, :document => {'these' => 'params'}
        assigns(:document).should be(mock_document)
      end

      it "redirects to the created document" do
        Document.stub(:new) { mock_document(:save => true) }
        post :create, :document => {}
        response.should redirect_to(document_url(mock_document))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved document as @document" do
        Document.stub(:new).with({'these' => 'params'}) { mock_document(:save => false) }
        post :create, :document => {'these' => 'params'}
        assigns(:document).should be(mock_document)
      end

      it "re-renders the 'new' template" do
        Document.stub(:new) { mock_document(:save => false) }
        post :create, :document => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested document" do
        Document.should_receive(:find).with("37") { mock_document }
        mock_document.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :document => {'these' => 'params'}
      end

      it "assigns the requested document as @document" do
        Document.stub(:find) { mock_document(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:document).should be(mock_document)
      end

      it "redirects to the document" do
        Document.stub(:find) { mock_document(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(document_url(mock_document))
      end
    end

    describe "with invalid params" do
      it "assigns the document as @document" do
        Document.stub(:find) { mock_document(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:document).should be(mock_document)
      end

      it "re-renders the 'edit' template" do
        Document.stub(:find) { mock_document(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested document" do
      Document.should_receive(:find).with("37") { mock_document }
      mock_document.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the documents list" do
      Document.stub(:find) { mock_document }
      delete :destroy, :id => "1"
      response.should redirect_to(documents_url)
    end
  end

end
