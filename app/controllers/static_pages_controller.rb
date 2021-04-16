class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :post_job, :home]
  skip_after_action :verify_authorized

  def home
    @jobs = Job.all.limit(5).order("id DESC")
  end

  def about
  end

  def post_job
  end

end
