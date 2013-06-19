class PaymentsController < ApplicationController

  def index

  Stripe.api_key = "YOUR_API_KEY"

  token = params[:stripeToken]

  charge = Stripe::Charge.create(
    :amount => 1000, # amount in cents, again
    :currency => "usd",
    :card => token,
    :description => "something about your customer"
  )
  end
  
end
