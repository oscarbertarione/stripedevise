Rails.configuration.stripe = {
  :publishable_key => 'pk_test_RkUr7XOnqvdXJa3aMiZP760X',
  :secret_key => 'sk_test_SHuHiaQugAdcbbPrkqp9Ppud'
}


Stripe.api_key = Rails.configuration.stripe[:secret_key]



