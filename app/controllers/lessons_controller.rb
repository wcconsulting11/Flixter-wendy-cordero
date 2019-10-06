class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course      , only: [:show]
  
  end
  def show
    end
    
    private
    
    def require_authorized_for_current_lesson
     if current_lesson.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end

    helper_method :current_lesson
    def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
    end
end
