class CoursesController < ApplicationController
    def index
        @course = Course.all
    end
    def show
        @course = Course.find(params[:id])
    end
    def new
        @course = Course.new
    end
    def create
        @course = Course.create(create_params)
        if @course.save
            redirect_to "/Courses/#{course.id}", :notice => "Your course was saved!"

        else
            render "new"
        end
    end
end
