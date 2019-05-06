class StudentsController < ApplicationController

  #调用index,new,create,show,edit,update,destroy方法前，都要先调用set_teacher方法
  before_action :set_teacher,only:[:index,:new,:create,:show,:edit,:update,:destroy]
  #调用show,edit,update,destroy方法前，都要先调用set_student方法
  before_action :set_student,only:[:show,:edit,:update,:destroy]

    def new
      @student=Student.new
    end

    def create
      @student=@teacher.student.create(student_params)
      if @student.save
          redirect_to school_grade_classschool_teacher_student_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher,@student)
        else
          redirect_to school_grade_classschool_teacher_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
        end
    end

    def edit
    end

    def index
      @students=@teacher.student.all
    end

    def destroy
      @student=Student.find(@school,@grade,@classschool,@teacher,params[:id])
      @student.destroy
      redirect_to school_grade_classschool_teacher_students_path(params[:school_id],params[:grade_id],params[:classschool_id],params[:teacher_id],@student)
    end

    def show
      @school = School.find(params[:school_id])
      @teacher=Teacher.new
    end
    
    def update
  		if @student.update(student_params)
        redirect_to school_grade_classschool_teacher_students_path(params[:school_id],params[:grade_id],params[:classschool_id],params[:teacher_id],@student)
  		else
  			render 'edit'
  		end
  	end

    private

    def student_params
      params.require(:student).permit(:unumber,:uname,:usex,:uage,:uemail)
    end

    def set_teacher
      @teacher=Teacher.find(params[:teacher_id])
    end

    def set_student
      @student=Student.find(params[:id])
    end

end
