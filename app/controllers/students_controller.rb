class StudentsController < ApplicationController

    def new
      @teacher=Teacher.find(params[:teacher_id])
      @student=Student.new
    end
    def create
      @teacher=Teacher.find(params[:teacher_id])
      @student=@teacher.student.create(student_params)
      if @student.save
          redirect_to school_grade_classschool_teacher_student_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher,@student)
        else
          redirect_to school_grade_classschool_teacher_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
        end
    end

    def edit
      @student=Student.find(params[:id])
    end

    def index
      @teacher=Teacher.find(params[:teacher_id])
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
      @student=Student.find(params[:id])
    end
    def update
  		@student=Student.find(params[:id])
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

end
