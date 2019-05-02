class AboutsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :

  def index

  end
  private


end
