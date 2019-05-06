class GradesController < ApplicationController
  #调用new,create,show,edit,update,destroy方法前，都要先调用set_school方法
  before_action :set_school,only:[:new,:create,:show,:edit,:update,:destroy]
  #调用show,edit,update,destroy方法前，都要先调用set_grade方法
  before_action :set_grade,only:[:show,:edit,:update,:destroy]

    def new
      @grade=Grade.new
    end

    def create
      @grade=@school.grade.create(grade_params)
      redirect_to school_grade_path(@school, @grade)
    end

    def edit
    end

    def show
    end

    def index
      @schools = School.find(params[:school_id])
      @grades=@schools.grade.all
    end

    def update
      if @grade.update(grade_params)
        redirect_to  school_grades_path(params[:school_id], @grade)
      else
        render 'edit'
      end
    end

    def destroy
      @grade.destroy
      redirect_to schools_path
    end

    private
    
    def grade_params
      params.require(:grade).permit(:gname)
    end
    # 增加共有方法
    def set_grade
      @grade=Grade.find(params[:id])
    end

    def set_school
      @school = School.find(params[:school_id])
    end

end
