class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource

  protected
    def find_project
      @project = current_user.projects.find(params[:id])
    end
    
    def find_project_for_management
      @project = current_user.projects.where('permissions.permission_type>=?', Permission::PERMISSION_TYPES[:manager]).find(params[:id])
    end
  
  private 
    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
  
  
  
end
