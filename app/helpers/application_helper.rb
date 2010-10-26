module ApplicationHelper
  
  def generate_html(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => 'new_'+method.to_s.singularize) do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end

  def generate_template(form_builder, method, options = {})
    escape_javascript generate_html(form_builder, method, options)
  end
  
  def priorities_for_select
    Ticket::PRIORITIES.sort{|a,b| a[1]<=>b[1]}
  end
  
  def users_in_project_for_select(project)
    project.users.map{|u| [u.full_name, u.id]}
  end
  
  def link_to_profile(owner, current_usr, project)
    owner.full_name
  end
  
end
