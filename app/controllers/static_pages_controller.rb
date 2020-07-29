class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :post_job]
  skip_after_action :verify_authorized

  def about
  end

  def post_job
  end

end
