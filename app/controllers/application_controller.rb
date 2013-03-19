class ApplicationController < ActionController::Base
  protect_from_forgery



  def slides
    @slides = Slide.all
    render 'admin/slides/index', slides: @slides
  end
end
