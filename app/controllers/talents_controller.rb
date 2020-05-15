class TalentsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

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

  # def show
  #   @talent = Talent.find(params[:id])
  # end


  private

  def talent_params
    params.require(:talent).permit(:full_name, :email, :mobile_number, :resume,
      :job_id, :cover_letter)
  end
end
