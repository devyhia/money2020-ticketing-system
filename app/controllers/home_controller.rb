require 'mercurypay'
class HomeController < ApplicationController
  before_action :auth, except: [:scan]
  def scan
  	render layout: false
  end

  def index
  	
  end

  def charge
  	
  end

  def post_charge
  	client = MercuryPay.new '023358150511666', 'xyz'
  	res = client.charge_with_card({
  		card_number: params[:card], 
  		cvc: params[:cvc], 
  		expir_month: params[:exp_month], 
  		expir_year: params[:exp_year], 
  		amount: 6.43,
  		invoice_id: "CHRGE20-#{current_user.id}"})
  
    ap res
  	if res[:CmdStatus].downcase == "approved"
  		current_user.balance += 4.0
  		current_user.save
  	end

  	return redirect_to '/'
  end

  protected
  def auth
  	return redirect_to '/login' unless user_signed_in?
  end
end
