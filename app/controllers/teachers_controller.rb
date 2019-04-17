class TeachersController < ApplicationController
    def new
      @classschool=Classschool.find(params[:classschool_id])
      @teacher= Teacher.new
    end
    def create
      @classschool=Classschool.find(params[:classschool_id])
      @teacher= @classschool.teachers.create(teacher_params)
      if @teacher.save
        redirect_to school_grade_classschool_teacher_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
      else
        redirect_to school_grade_classschool_path(params[:school_id],params[:grade_id],@classschool)
      end
    end

    def index
      @classschool=Classschool.find(params[:classschool_id])
      @teachers=@classschool.teachers.all
    end

    def edit
      @teacher=Teacher.find(params[:id])
    end

    def destroy
      @teacher=Teacher.find(params[:id])
      @teacher.destroy
      redirect_to school_grade_classschool_teachers_path(params[:school_id],params[:grade_id],params[:classschool_id],@teacher)
    end

    def show
      @school = School.find(params[:school_id])
      @classschool=Classschool.new
      @teacher=Teacher.find(params[:id])
    end
    def update
      @teacher=Teacher.find(params[:id])
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


end
