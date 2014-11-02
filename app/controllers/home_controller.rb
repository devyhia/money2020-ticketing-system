class HomeController < ApplicationController
  before_action :auth, except: [:scan]
  def scan
  	render layout: false
  end

  def index
  	
  end

  protected
  def auth
  	return redirect_to '/login' unless user_signed_in?
  end
end
