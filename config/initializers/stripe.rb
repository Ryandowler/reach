Rails.configuration.stripe = {
  #:publishable_key => ENV['PUBLISHABLE_KEY'],
  #:secret_key      => ENV['SECRET_KEY']
  :publishable_key => 'pk_test_6Pis3aRYXCMPRTY7cR40rPXy',
  :secret_key      => 'sk_test_DBbfhkIFmcyICu08qPMnsWlS'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]