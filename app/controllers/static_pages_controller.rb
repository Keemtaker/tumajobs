class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :pricing]
  skip_after_action :verify_authorized


  def about
  end

  def pricing
  end

end
