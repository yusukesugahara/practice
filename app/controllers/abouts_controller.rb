class AboutsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :login_check

  def index
  end

  private
  def login_check
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
