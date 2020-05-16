class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create, :new]

  def index
    @search = Job.ransack(params[:q])
    @jobs = policy_scope(Job)
    @jobs = @search.result(distinct: true).order("id DESC")
  end

  def new
    if request.fullpath == new_job_path
      @job = Job.new
      authorize @job
    else
      authenticate_user!
      @company = Company.find(params[:company_id])
      @job = @company.jobs.new
      authorize @job
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
    authorize @job
  end

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def update
    edit
    if @job.update(job_params)
      flash[:notice] = "You have successfully edited the job posting"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    if @job.destroy
        flash[:notice] = "You have successfully deleted the job posting"
       redirect_to company_path(@job.company)
    end
  end

  private

  def registered_company_job
    @job = Job.new(job_params)
    @company =  params[:company_id]
    @job.company_id = @company
    authorize @job
    if params[:previewButt] == "Preview"
      flash[:alert] = "This is a PREVIEW of your job posting. Go back to the previous tab to Post the job or make edits."
      render :create
    else params[:createButt] == "Submit"
      if @job.save
        flash[:notice] = "Congrats on successfully posting a job!"
        redirect_to company_job_path(@company, @job)
      else
        render :new
      end
    end
  end

  def unregistered_company_job
    @job = Job.new(job_params)
    authorize @job
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
