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
    if @company.save
      redirect_to @company
    else
      render :new
    end
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
    if @company.update(company_params)
      redirect_to @company
    else
      render :edit
    end
  end

  def company_params
    params.require(:company).permit(:name, :description, :website, :address, :location, :logo, :user_id, perk_ids:[])
  end

end
