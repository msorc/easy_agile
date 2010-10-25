require 'redmine'
require 'dispatcher'
require 'project_patch'
require 'user_patch'

Redmine::Plugin.register :easy_agile do
  name 'Redmine Easy Agile plugin'
  author 'Sphere Consulting Inc.'
  description 'Simple scrum board for agile teams'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :easy_agile do
    permission :easy_agile_manage_iterations, :iterations => [:index, :new, :create, :show, :edit, :update]
    permission :easy_agile_view_home,       :iterations => :home
    permission :easy_agile_manage_stories, :stories => [:index, :new, :create, :show, :edit, :update, :backlog]
    permission :easy_agile_manage_acceptance_criteria, :acceptance_criteria => [:create, :edit, :update, :destroy]
  end

  Dispatcher.to_prepare do
    Project.send(:include, ProjectPatch) unless Project.included_modules.include? ProjectPatch
    User.send(:include, UserPatch) unless User.included_modules.include? UserPatch
  end

  menu :project_menu, :iterations, { :controller => 'iterations', :action => 'home' }, :caption => 'Iterations', :before => :calendar, :param => :project_id

  # feature
  Mime::Type.register "text/plain", :feature

  # cretiria inflections
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'criterion', 'criteria'
  end

end
