class EasyAgileController < ApplicationController
  before_filter :find_optional_project

  helper :stories

  def index
    if @project.stories.empty?
      render :template => 'easy_agile/index_guidance'
    end
  end

  def my_page
  end
end
