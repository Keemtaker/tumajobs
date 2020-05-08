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
    if current_user
      registered_company_job
    else
      unregistered_company_job
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

  private

  def registered_company_job
    @job = Job.new(job_params)
    @company =  params[:company_id]
    @job.company_id = @company
      if params[:previewButt] == "Preview"
        flash[:alert] = "This is a PREVIEW of your job posting. Go back to the previous tab to Post the job or make edits."
        render :create
      elsif params[:createButt] == "Submit"
        @job.save
        flash[:notice] = "Congrats on successfully posting a job!"
        redirect_to company_job_path(@company, @job)
      else
        render :new
      end
  end

  def unregistered_company_job
    @job = Job.new(job_params)
      if params[:previewButt] == "Preview"
        flash[:alert] = "This is a PREVIEW of your job posting. Go back to the previous tab to Post the job or make edits."
        render :create
      elsif
        params[:createButt] == "Submit"
        @job.save
        flash[:notice] = "Congrats on successfully posting a job!"
        redirect_to @job
      else
        render :new
      end
  end


  def job_params
    params.require(:job).permit(:title, :description, :role, :job_type, :keywords, :salary, :location, :company_id, :unregistered_company_name, :unregistered_company_logo,
    :unregistered_company_email, :job_application_type, :job_email, :job_url, perk_ids:[])
  end

end
