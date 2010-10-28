module EasyAgileHelper
  def ea_tabs
    [{:name => 'dashboard', :action => :project_easy_agile, :partial => 'projects/edit', :label => :dashboard},
     {:name => 'backlog', :action => :project_backlog, :partial => 'projects/settings/modules', :label => :backlog},
     {:name => 'iterations', :action => :project_iterations, :partial => 'projects/settings/members', :label => :iteration_plural},
    ]
  end
end
