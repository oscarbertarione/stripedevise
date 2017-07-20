class PaymentsController < ApplicationController
  before_action :amount_to_be_charged
  before_action :set_description
  before_action :set_plan
  #before_action :authenticate_user!

  def new
  end

  def create



    if User.exists?(email: params[:email])
    flash[:error] = "Email ya registrado"
    redirect_to new_payment_path

else

 @user = User.create(
    email: params[:email],
     password: params[:password],
     name: params[:email]
     )



    customer = StripeTool.create_customer(email: params[:email], 
                                            stripe_token: params[:stripeToken])
    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: @description)

     
    redirect_to payment_thanks_path

  end




  rescue Stripe::CardError => e
    flash[:error] = e.message
    @user.destroy
    redirect_to new_payment_path
  end

  def thanks
  end

  private

    def set_description
      @description = "Basic Membership"
    end

    def amount_to_be_charged
      @amount = 2999
    end

    def set_plan
      @plan = 9999
    end
end
