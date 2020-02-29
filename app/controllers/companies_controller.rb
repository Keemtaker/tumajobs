class CompaniesController < ApplicationController

  def index
     @companies = Company.all
  end

  def new
     @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    @company.save
  end

  def show
     @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    edit
    @company.update(company_params)
  end

  def company_params
    params.require(:company).permit(:name, :description, :website, :address, :location, :user_id)
  end

end