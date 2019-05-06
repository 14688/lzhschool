class TeachersController < ApplicationController

  #调用index,new,create,show,edit,update,destroy方法前，都要先调用set_classschool方法
  before_action :set_classschool,only:[:index,:new,:create,:show,:edit,:update,:destroy]
  #调用show,edit,update,destroy方法前，都要先调用set_teacher方法
  before_action :set_teacher,only:[:show,:edit,:update,:destroy]

    def new
      @teacher= Teacher.new
    end

    def create
      @teacher= @classschool.teachers.create(teacher_params)
      if @teacher.save
        redirect_to school_grade_classschool_teacher_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
      else
        redirect_to school_grade_classschool_path(params[:school_id],params[:grade_id],@classschool)
      end
    end

    def index
      @teachers=@classschool.teachers.all
    end

    def edit
    end

    def destroy
      @teacher.destroy
      redirect_to school_grade_classschool_teachers_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
    end

    def show
      @school = School.find(params[:school_id])
      @classschool=Classschool.new
    end
    
    def update
      if @teacher.update(teacher_params)
        redirect_to school_grade_classschool_teachers_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
      else
        render 'edit'
      end
    end

    private

    def teacher_params
      params.require(:teacher).permit(:tnumber,:tname,:tsex,:title,:temail)
    end

    def set_classschool
      @classschool=Classschool.find(params[:classschool_id])
    end


     def set_teacher
      @teacher=Teacher.find(params[:id])
    end

end
