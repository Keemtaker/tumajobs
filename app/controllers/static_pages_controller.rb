class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :pricing]

  def about
  end

  def pricing
  end

end
