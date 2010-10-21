class ApplicationController < ActionController::Base
  # include ExceptionNotifiable

  # helper :all # include all helpers, all the time

  # # layout :decide_layout

  # protected

  # def decide_layout
  #   layout = ''
  #   respond_to do |format|
  #     format.html do
  #       layout = 'application'
  #     end

  #     format.js do
  #       layout = 'request'
  #     end
  #   end

  #   layout
  # end

  # def set_current_user_on_resource
  #   resource_name = controller_name.singularize
  #   resource = instance_variable_get("@#{resource_name}")
  #   if resource && resource.respond_to?(:current_user=)
  #     resource.current_user = current_user
  #   end
  # end
end
