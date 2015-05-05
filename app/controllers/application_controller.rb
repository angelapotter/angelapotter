class ApplicationController < ActionController::Base

  helper_method :body_css_class

  def body_css_class
    params[ :action ].camelcase(:lower)
  end

end
