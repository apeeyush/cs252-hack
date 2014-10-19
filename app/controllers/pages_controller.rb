class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:banking, :transfer]
  skip_before_filter :verify_authenticity_token, :only => [:banking, :transfer]

  def main
  end

  def banking
  	@users = User.all
  end

  def transfer
  	to_email = params[:email]
  	amount = params[:amount].to_i
  	to_user = User.where(email: to_email)
  	if to_user.count > 0 && amount.is_a?(Integer) && amount >= 0 && amount < current_user.amount
  	  to_user = to_user.first
	  curr_user_new_amount = current_user.amount - amount
	  to_user_new_amount = to_user.amount + amount
	  current_user.update(amount: curr_user_new_amount)
	  to_user.update(amount: to_user_new_amount)
	  redirect_to pages_banking_path
	else
	  redirect_to pages_banking_path
	end
  end

end
