ActionController::Routing::Routes.draw do |map|

  map.resources :keyboard_shortcuts

  map.resources :projects do |project|
    project.resource :easy_agile, :controller => 'easy_agile', :member => { :my_page => :get }

    project.resources :iterations, :collection => { :finished => :get, :planned => :get } do |iteration|
      iteration.resource :burndown
      iteration.resource :active_iteration
      iteration.resources :stories
    end

    project.resources :stories, :member => { :estimate => :get },
    :collection => { :backlog => :get, :finished => :get }  do |story|
      story.resources :acceptance_criteria
    end

    project.resources :story_team_members
  end

  map.resource :home, :controller => 'home'

  map.agile_terminology '/agile_terminology/:action', :controller => 'agile_terminology'
end
