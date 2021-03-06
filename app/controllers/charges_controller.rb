class ChargesController < ApplicationController
  #never used stripe, but if continued with it id use ENV variables
  Stripe.api_key = 'sk_test_DBbfhkIFmcyICu08qPMnsWlS'

  def new
  end

  def create
    # Amount in cents
    @amount = 500
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
