class TalentsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
    redirect_to new_job_talent_path
    skip_policy_scope
  end

  def new
    @job = Job.find(params[:job_id])
    @talent = @job.talents.new
  end

  def create
    @talent = Talent.new(talent_params)
    @job =  params[:job_id]
    @talent.job_id = @job
    if @talent.save
      flash[:notice] = "You have successfully completed your job application!"
      redirect_to jobs_path
    else
      render :new
    end
  end

  private

  def talent_params
    params.require(:talent).permit(:full_name, :email, :mobile_number, :resume,
      :job_id, :cover_letter)
  end
end
