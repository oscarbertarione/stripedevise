class ChargesController < ApplicationController


  

  def new
end

def create
  # Amount in cents
  @amount = 500
  @clave=123456


if User.exists?(email: params[:stripeEmail])
flash[:error] = "Email ya registrado"
  redirect_to new_charge_path

else

  @user = User.create(
    email: params[:stripeEmail],
     password: "123456",
     name: params[:stripeEmail]
     )
  
  


     
     
  
      
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end








  




