class ApplicationController < ActionController::Base
  include ExceptionNotifiable

  # helper :all # include all helpers, all the time

  # layout :decide_layout

  protected

  def decide_layout
    layout = ''
    respond_to do |format|
      format.html do
        layout = 'application'
      end

      format.js do
        layout = 'request'
      end
    end

    layout
  end

end
