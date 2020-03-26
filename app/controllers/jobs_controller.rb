class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
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
    params.require(:job).permit(:title, :description, :job_type, :keywords, :salary, :location, :company_id)
  end

end
