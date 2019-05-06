class ClassschoolsController < ApplicationController
  #调用index,new,create,show,edit,update,destroy方法前，都要先调用set_grade方法
  before_action :set_grade,only:[:index,:new,:create,:show,:edit,:update,:destroy]
  #调用show,edit,update,destroy方法前，都要先调用set_classschool方法
  before_action :set_classschool,only:[:show,:edit,:update,:destroy]

    def new
      @classschool=Classschool.new
    end

    def create
      @classschool=@grade.classschools.create(classschool_params)
      redirect_to school_grade_classschool_path(params[:school_id],@grade,@classschool)
    end
    
    def edit
    end

    def show
      @student=Student.new
    end

    def index
      @classschools= @grade.classschools.all
    end

    def update
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

    def set_grade
      @grade=Grade.find(params[:grade_id])
    end

    def set_classschool
      @classschool=Classschool.find(params[:id])
    end

end
