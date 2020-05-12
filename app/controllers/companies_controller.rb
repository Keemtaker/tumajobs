class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @company = Company.new
    company_authorization
    if current_user.company
      @company = current_user.company[:id]
      redirect_to company_path(@company)
    end
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    company_authorization
    company_setup
  end

  def show
   @company = Company.find(params[:id])
   company_authorization
  end

  def edit
    @company = Company.find(params[:id])
    company_authorization
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

  private

  def company_authorization
    authorize @company
  end

  def company_setup
    if params[:previewButt] == "Preview"
      flash[:alert] = "This is a PREVIEW of your company profile. Go back to the previous tab to Submit or make edits."
      render :create
    elsif params[:createButt] == "Submit"
      @company.save
      flash[:notice] = "Congrats on creating a company profile."
      redirect_to @company
    else
      render :new
    end
  end

  def company_params
    params.require(:company).permit(:name, :description, :website, :address, :location, :logo, :user_id, perk_ids:[])
  end

end
