class WorkReportsController < ApplicationController
  before_filter :find_project  
  # GET /work_reports
  # GET /work_reports.xml
  def index
    @work_reports = @project.work_reports.ordered.all
    @work_report = @project.work_reports.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_reports }
    end
  end

  # GET /work_reports/1
  # GET /work_reports/1.xml
  def show
    @work_report = @project.work_reports.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_report }
    end
  end

  # GET /work_reports/new
  # GET /work_reports/new.xml
  def new
    @work_report = @project.work_reports.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_report }
    end
  end

  # POST /work_reports
  # POST /work_reports.xml
  def create
    @work_report = @project.work_reports.new(params[:work_report])
    @work_report.user = current_user
    respond_to do |format|
      if @work_report.save
        format.html { redirect_to([@project, :work_reports], :notice => 'Work report was successfully created.') }
        format.xml  { render :xml => @work_report, :status => :created, :location => @work_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /work_reports/1
  # DELETE /work_reports/1.xml
  def destroy
    return redirect_to(project_work_reports(@project)) unless @project.leaders.member?(current_user)
    @work_report = @project.work_reports.find(params[:id])
    @work_report.destroy

    respond_to do |format|
      format.html { redirect_to(projec_work_reports_url(@project)) }
      format.xml  { head :ok }
    end
  end
end
