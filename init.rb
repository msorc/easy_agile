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
    permission :easy_agile_view_iterations, :iterations => :index
    permission :easy_agile_view_home,       :iterations => :home
  end

  Dispatcher.to_prepare do
    Project.send(:include, ProjectPatch) unless Project.included_modules.include? ProjectPatch
    User.send(:include, UserPatch) unless User.included_modules.include? UserPatch
  end

  menu :project_menu, :iterations, { :controller => 'iterations', :action => 'home' }, :caption => 'Iterations', :before => :calendar, :param => :project_id
end
