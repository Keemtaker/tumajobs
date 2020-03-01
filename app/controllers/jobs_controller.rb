class JobsController < ApplicationController

  def index
    @jobs = Jobs.all
  end


  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @company = params[:company_id]
    @job.company_id = @company
    @job.save
  end

  def show
    @job = Job.find(params[:id])
  end

  def company_params
    params.require(:job).permit(:title, :description, :job_type, :keywords, :salary, :location, :company_id)
  end

end
