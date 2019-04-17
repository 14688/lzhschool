class ClassschoolsController < ApplicationController
    def new
      @grade=Grade.find(params[:grade_id])
      @classschool=Classschool.new
    end
    def create
      @grade=Grade.find(params[:grade_id])
      @classschool=@grade.classschool.create(classschool_params)
      redirect_to school_grade_classschool_path(params[:school_id],@grade,@classschool)
    end
    def edit
      @classschool=Classschool.find(params[:id])
    end

    def show
      @grade= Grade.find(params[:grade_id])
      @student=Student.new
      @classschool=Classschool.find(params[:id])
    end

    def index
      @grade=Grade.find(params[:grade_id])
      @classschools= @grade.classschool.all
    end

    def update
      @classschool=Classschool.find(params[:id])
      if @classschool.update(classschool_params)
        redirect_to  school_grade_classschools_path(params[:school_id], params[:grade_id],@classschool)
      else
        render 'edit'
      end
    end

    def destroy
      @classschool=Classschool.find(@school,@grade,params[:id])
      @classschool.destroy
      redirect_to school_grade_classschools_path(params[:school_id],params[:grade_id],@classschool)
    end

    private
    def classschool_params
      params.require(:classschool).permit(:cname,:clocationgrade)
    end

end
