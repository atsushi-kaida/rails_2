class HomeController < ApplicationController
  before_filter :authenticate_user!#, only: %i(index)
  def index
    if user_signed_in?
    end
  end
end
