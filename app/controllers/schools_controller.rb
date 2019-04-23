class SchoolsController < ApplicationController
  	def index
  		@schools=School.all.order("created_at DESC").paginate(:page => params[:page],:per_page =>5)
      # @school=School.find(params[:school_id])
      # @grade=@school.grade.find(params[:id])
  	end

  	def show
  		@school=School.find(params[:id])
  	end

  	def new
  		@school=School.new
  	end


  	def edit
  		@school=School.find(params[:id])
  	end

  	# def create
  	# 	@school=School.new(params_school)
  	# 	if @school.save
  	# 		redirect_to @school
  	# 	else
  	# 		render 'new'
  	# 	end
  	# end
    def create
      @school=School.new(params_school)
      respond_to do |format|
        if @school.save
          format.html do
            redirect_to schools_path
          end
          #format.html{redirect_to @school,notice: 'User was successfully created.')
          format.json{render json:@school.to_json }
        else
          format.html{ render school:"new"}
          format.json{render json: @school.errors,status: :unprocessable_entity}
        end
      end
    end

    def update
      @school=School.find(params[:id])
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

  	# def update
  	# 	@school=School.find(params[:id])
  	# 	if @school.update(params_school)
  	# 		redirect_to @school
  	# 	else
  	# 		render 'edit'
  	# 	end
  	# end

  	def destroy
  		@school=School.find(params[:id])
  		@school.destroy
  		redirect_to schools_path
  	end

  	private
  	def params_school
  		params.require(:school).permit(:sname,:ssite,:sphone)
  	end

end
