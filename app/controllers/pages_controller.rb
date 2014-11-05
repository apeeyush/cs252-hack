class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:banking, :transfer, :transactions, :deposit]
  skip_before_filter :verify_authenticity_token, :only => [:banking, :transfer, :deposit]

  def main
  end

  def banking
  	@users = User.all
  end

  def transfer
  	to_email = params[:email]
  	amount = params[:amount].to_i
  	to_user = User.where(email: to_email)
  	if to_user.count > 0 && params[:amount].to_i.to_s == params[:amount]
  	  to_user = to_user.first
  	  if to_user.email != current_user.email  && amount.is_a?(Integer) && amount >= 0 && amount < current_user.amount
        ActiveRecord::Base.transaction do
  		    curr_user_new_amount = current_user.amount - amount
  		    to_user_new_amount = to_user.amount + amount
  		    current_user.update(amount: curr_user_new_amount)
  		    to_user.update(amount: to_user_new_amount)
  		    new_transfer = current_user.transfers.new
  		    new_transfer.amount = amount
          new_transfer.to_user = to_user.id
          new_transfer.to_email = to_user.email
  		    new_transfer.save
          flash[:success] = "Transfer Successful"
          redirect_to pages_banking_path
        end
	    else
	  	  flash[:error] = "Nigga!! If you stop trespassing now, that would be the end of it. But if you don't, I will look for you, find you and hack your server. Good Luck!"
		    redirect_to pages_banking_path
	    end
	  else
	    flash[:error] = "Nigga!! If you stop trespassing now, that would be the end of it. But if you don't, I will look for you, find you and hack your server. Good Luck!"
	    redirect_to pages_banking_path
	  end
  end

  def deposit
    amount = params[:amount].to_i
    if params[:amount].to_i.to_s == params[:amount] && amount.is_a?(Integer) && amount >= 0
      curr_user_new_amount = current_user.amount + amount
      current_user.update(amount: curr_user_new_amount)
      new_transfer = current_user.transfers.new
      new_transfer.amount = amount
      new_transfer.to_user = current_user.id
      new_transfer.to_email = current_user.email
      new_transfer.save
      flash[:success] = "Deposit Successful"
      redirect_to pages_banking_path
    else
      flash[:error] = "Nigga!! If you stop trespassing now, that would be the end of it. But if you don't, I will look for you, find you and hack your server. Good Luck!"
      redirect_to pages_banking_path
    end
  end

  def transactions
  	@money_transferred = current_user.transfers
    @money_received = Transfer.where(to_user: current_user.id)
    @users = User.all
  end

end
