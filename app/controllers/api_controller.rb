class ApiController < ApplicationController
  def charge_customer
  	user = User.find(params[:id])
  	if user.balance >= 1.5
  		user.balance -= 1.5
  		user.save

  		render json: {
	  		status: true
	  	}
  	else
  		render json: {
	  		status: false
	  	}
  	end
  	
  end

  def get_balance
  	user = User.where(id: params[:id], token: params[:token])[0]
  	render json: {
  		balance: user.balance
  	}
  end
end
