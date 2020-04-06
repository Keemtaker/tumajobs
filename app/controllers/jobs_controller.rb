class JobsController < ApplicationController

  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result(distinct: true).order("id DESC")
  end

  def new
    if current_user
      @company = Company.find(params[:company_id])
      @job = @company.jobs.new
    else
      @job = Job.new
    end
  end

  def create
    @job = Job.new(job_params)
    @company = params[:company_id]
    @job.company_id = @company
    if @job.save
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])

  end

  def update
    edit
    @company = params[:company_id]
    @job.company_id = @company
    @job.update(job_params)
      if @job.update(job_params)
        redirect_to company_job_path(@company, @job)
      else
        render :edit
      end
  end

  def job_params
    params.require(:job).permit(:title, :description, :role, :job_type, :keywords, :salary, :location, :company_id, :unregistered_company_name, :unregistered_company_logo,
    :job_application_type, :job_email, :job_url, perk_ids:[])
  end

end
