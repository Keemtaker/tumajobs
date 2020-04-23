class JobCandidatesController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @job_candidate = @job.job_candidates.new
  end

  def create
    @job_candidate = JobCandidate.new(job_candidate_params)
    @job =  params[:job_id]
    @job_candidate.job_id = @job
    @job_candidate.save

      if @job_candidate.save
       redirect_to jobs_path
      else
       render :new
       end
  end

  def show
    @job_candidate = JobCandidate.find(params[:id])
  end


  private

  def job_candidate_params
    params.require(:job_candidate).permit(:full_name, :email, :mobile_number, :resume,
      :job_id, :cover_letter)
  end
end
