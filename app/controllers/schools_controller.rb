class SchoolsController < ApplicationController
  #调用show,edit,update,destroy方法前，都要先调用set_school方法
  before_action :set_school,only:[:show,:edit,:update,:destroy]
  
  	def index
      # @user=User.find(params[current_user.id])
  		@schools=School.all.order("created_at DESC").paginate(:page => params[:page],:per_page =>5)
      
  	end

    def upvote
      @school=School.find(params[:school_id])
      @school.votes.create
      redirect_to(school_path(@school))
    end
    
  	def show
  	end

  	def new
  		@school=School.new
  	end


  	def edit

  	end
    #普通反式
  	# def create
  	# 	@school=School.new(params_school)
  	# 	if @school.save
  	# 		redirect_to @school
  	# 	else
  	# 		render 'new'
  	# 	end
  	# end

    #使用ajax
    def create
      @school=School.new(params_school)
      respond_to do |format|
        if @school.save
          format.html do
            redirect_to schools_path
          end
          format.json{render json:@school.to_json }
        else
          format.html{ render school:"new"}
          format.json{render json: @school.errors,status: :unprocessable_entity}
        end
      end
    end

    #使用ajax
    def update
      respond_to do |format|
        if @school.update(params_school)
          format.html do
            redirect_to schools_path
          end
          format.json{render json:@school,status: :updated,location: @school}
        else
          format.html{render school:"edit"}
          format.json{render json:@school.errors,status: :unprocessable_entity}
        end
      end
    end

    #普通方式
  	# def update
  	# 	@school=School.find(params[:id])
  	# 	if @school.update(params_school)
  	# 		redirect_to @school
  	# 	else
  	# 		render 'edit'
  	# 	end
  	# end

  	def destroy
  		@school.destroy
  		redirect_to schools_path
    end

  	private

  	def params_school
      if params[:school].present?
               params.require(:school).permit(:sname,:ssite,:sphone)
      end  
  	end

    def set_school
      @school=School.find(params[:id])
    end

end
