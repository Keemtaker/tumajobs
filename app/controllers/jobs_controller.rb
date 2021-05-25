class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create, :new, :success, :flutterwave_webhook]
  protect_from_forgery :except => :flutterwave_webhook

  def index
    @search = Job.where("payment_completed = true").ransack(params[:q])
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
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def success
    skip_authorization
    require 'cgi'
    uri = URI.parse(request.original_url)
    params = CGI.parse(uri.query)
    if params["status"].include? "successful"
      job = Job.find_by(transaction_reference: params["tx_ref"])
      job.update(payment_completed: true)
      redirect_to job_path(job)
      flash[:notice] = "Congrats on successfully posting a job!"
    else
      redirect_to root_path
      flash[:alert] = "The Job posting did not complete successfully. Kindly contact us at #{ENV['GMAIL_ADDRESS']} for support"
    end
  end

  def flutterwave_webhook
    skip_authorization
    require "json"
    request_json = JSON.parse(request.body.read)
    if request_json["status"] == "successful"
      job = Job.find_by(transaction_reference: request_json["txRef"])
      job.update(payment_completed: true)
      JobMailer.job_post_confirmation(job).deliver_now
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
    @job.unregistered_company_validation = true
    if params[:previewButt] == "Preview"
      flash[:alert] = "This is a PREVIEW of your job posting. Go back to the previous tab to Post the job or make edits."
      render :create
    else params[:createButt] == "Submit"
      if @job.save
          flutterwave_standard_payment
      else
         render :new
      end
    end
  end

  def flutterwave_standard_payment
    payment_details = {
      "tx_ref": @job.transaction_reference,
      "amount": "25",
      "currency": "GHS",
      "redirect_url": "#{ENV['FLUTTERWAVE_REDIRECT']}/success",
      "payment_options":["mobilemoney", "card"],
      "meta":{
        "job_id": @job.id,
        "job_title": @job.title
      },
      "customer":{
        "email": @job.unregistered_company_email,
        "company": @job.unregistered_company_name
      },
      "customizations":{
        "title": "Tumajobs",
        "logo": "https://res.cloudinary.com/hbgbweyhq/image/upload/v1620037964/favicon_sqziot.png"
      }
    }

    response = HTTParty.post("https://api.flutterwave.com/v3/payments", body: payment_details.to_json, headers: { "Authorization" => "Bearer #{ENV['FLUTTERWAVE_SECRET_KEY']}", 'Content-Type' => 'application/json'})
    if response["status"] == "success"
      redirect_to response["data"]["link"]
    else
      render :new
      flash[:alert] = "Something went wrong. Kindly try to post the job again or contact #{ENV['GMAIL_ADDRESS']} for support"
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :role, :job_type, :keywords, :salary, :location, :company_id, :unregistered_company_name, :unregistered_company_logo,
    :unregistered_company_email, :job_application_type, :job_email, :job_url, :job_expiration_date, perk_ids:[])
  end

end
