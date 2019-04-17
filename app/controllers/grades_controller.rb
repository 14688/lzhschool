class GradesController < ApplicationController
    def new
      @school=School.find(params[:school_id])
      @grade=Grade.new
    end

    def create
      @school=School.find(params[:school_id])
      @grade=@school.grade.create(grade_params)
      redirect_to school_grade_path(@school, @grade)
    end

    def edit
        @grade=Grade.find(params[:id])
    end

    def show
      @school = School.find(params[:school_id])
      @grade=Grade.find(params[:id])
    end

    def index
      @schools = School.find(params[:school_id])
      @grades=@schools.grade.all
    end

    def update
      @grade=Grade.find(params[:id])
      if @grade.update(grade_params)
        redirect_to  school_grades_path(params[:school_id], @grade)
      else
        render 'edit'
      end
    end

    def destroy
      @grade=Grade.find(@school,params[:id])
      @grade.destroy
      redirect_to schools_path
    end

    private
    def grade_params
      params.require(:grade).permit(:gname)
    end


end
