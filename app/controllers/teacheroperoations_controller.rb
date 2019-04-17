class TeacheroperoationsController < ApplicationController

  def edit
    @teacher=Teacher.find(params[:id])
    @classschool=Classschool.find(params[:classschool_id])
  end

  def show
    @teacher=Teacher.find(params[:id])
    @classschool=Classschool.find(params[:classschool_id])
  end

end
